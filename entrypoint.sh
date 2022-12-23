#!/bin/bash

repository="https://repo1.maven.org/maven2/"

while [ $# -gt 0 ]; do
  case "$1" in
    --artifactId=*)
      artifactId="${1#*=}"
      ;;
    --groupId=*)
      groupId="${1#*=}"
      ;;
    --outputDirectory=*)
      outputDirectory="${1#*=}"
      ;;
    --repository=*)
      repository="${1#*=}"
      ;;
    --version=*)
      version="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument '$1'\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done

mvn -B -f /builder.pom.xml  dependency:copy-dependencies -s /usr/share/maven/ref/settings-docker.xml \
  -DoutputDirectory=$(pwd)/$outputDirectory \
  -Dartifact.repository=${repository} \
  -Dartifact.groupId=${groupId} \
  -Dartifact.artifactId=${artifactId} \
  -Dartifact.version=${version}