#!/bin/bash

case "$1" in
 "run")
    export JAVA_HOME=/opt/jdk1.8.0_281/
    export PATH=${JAVA_HOME}/bin:$PATH
    mvn -pl modules/openapi-generator-cli,modules/openapi-generator -DskipTests clean package
    rm output -Rf
    java -jar modules/openapi-generator-cli/target/openapi-generator-cli.jar generate -i $2 -g php-laravel -o output
    ;;
  "compile")
    export JAVA_HOME=/opt/jdk1.8.0_281/
    export PATH=${JAVA_HOME}/bin:$PATH
    mvn -pl modules/openapi-generator-cli,modules/openapi-generator -DskipTests clean package
    ;;
  "generate")
    rm output -Rf
    java -jar modules/openapi-generator-cli/target/openapi-generator-cli.jar generate -i $2 -g php-laravel -o output
    ;;
  *)
    echo "You have failed to specify what to do correctly."
    exit 1
    ;;
esac

