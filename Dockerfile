FROM jboss/base-jdk:7

LABEL maintainer="mail@gdietz.de"

ENV JBOSS_AS_VERSION 7.1.1.Final
ENV JBOSS_AS_SHA1 fcec1002dce22d3281cc08d18d0ce72006868b6f
ENV JBOSS_HOME /opt/jboss/as

USER root

RUN cd $HOME \
    && curl -O https://download.jboss.org/jbossas/7.1/jboss-as-$JBOSS_AS_VERSION/jboss-as-$JBOSS_AS_VERSION.tar.gz \
    && sha1sum jboss-as-$JBOSS_AS_VERSION.tar.gz | grep $JBOSS_AS_SHA1 \
    && tar xf jboss-as-$JBOSS_AS_VERSION.tar.gz \
    && mv $HOME/jboss-as-$JBOSS_AS_VERSION $JBOSS_HOME \
    && rm jboss-as-$JBOSS_AS_VERSION.tar.gz \
    && chown -R jboss:0 ${JBOSS_HOME} \
    && chmod -R g+rw ${JBOSS_HOME}

ENV LAUNCH_JBOSS_IN_BACKGROUND true

USER jboss

EXPOSE 8080

CMD ["/opt/jboss/as/bin/standalone.sh", "-b", "0.0.0.0"]
