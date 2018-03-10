#!/bin/bash

## type 'source setup' on the command line to expose the command names
## for the following javascript engines

## change this directory
JS_DIR=${HOME}/projects/jsfuzz/javascript

RHINO_PATH="${JS_DIR}/rhino/buildGradle/libs/rhino-1.7.9-SNAPSHOT.jar"
JAVA_SCRIPT_CORE_PATH="${S_DIR}/WebKit/WebKitBuild/Release/bin"
CHACRA_PATH="${JS_DIR}/ChakraCore/out/Release"
SPIDER_MONKEY="${JS_DIR}/gecko-dev/js/src/build_OPT.OBJ/dist/bin"

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${JAVA_SCRIPT_CORE_PATH}/../lib

alias rhino='function _rhino(){ java -jar ${RHINO_PATH} $1 ; }; _rhino'
alias jscore='function _jscore(){ ${JAVA_SCRIPT_CORE_PATH}/jsc $1 ; }; _jscore'
alias chacra='function _chacra(){ ${CHACRA_PATH}/ch $1 ; }; _chacra'
alias smonkey='function _spidermonkey(){ ${SPIDER_MONKEY}/js $1 ; }; _spidermonkey'