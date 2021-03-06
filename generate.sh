#!/bin/bash

SRC="/gopath/src/github.com/CovenantSQL/GNTE"
export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CLEAN=$DIR/scripts/clean.sh

if [ -f $CLEAN ];then
    $CLEAN
    rm -rf $CLEAN
fi

docker run --rm -it -v $DIR:$SRC gnte $SRC/scripts/gobuild.sh $*

$DIR/scripts/launch.sh
