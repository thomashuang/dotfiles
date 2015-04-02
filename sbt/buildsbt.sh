#!/bin/sh
echo "mkdir $1 and enter"
mkdir $1
cd "$1"
mkdir -p src/{main,test}/{java,resources,scala}
mkdir lib project target
# create an initial build.sbt file

result=$(printf "name := \"%s\"\nversion := \"1.0\"\nscalaVersion := \"2.10.4\"" "$1")
echo -e "$result" > build.sbt
echo "success"