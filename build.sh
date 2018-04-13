#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd $DIR

docker build -t gdietz/jboss-as:7.1.1 -t gdietz/jboss-as .
