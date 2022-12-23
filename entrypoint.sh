#!/bin/sh -l


while [ $# -gt 0 ]; do
  case "$1" in
    --artifactId=*)
      artifactId="${1#*=}"
      ;;
    --groupId=*)
      groupId="${1#*=}"
      ;;
    --version=*)
      version="${1#*=}"
      ;;
    --outputDirectory=*)
      outputDirectory="${1#*=}"
      ;;
    *)
      printf "***************************\n"
      printf "* Error: Invalid argument.*\n"
      printf "***************************\n"
      exit 1
  esac
  shift
done

mvn -B -f /builder.pom.xml  dependency:copy-dependencies -s /usr/share/maven/ref/settings-docker.xml \
  -DoutputDirectory=$(pwd)/$outputDirectory \
  -Dwanted.groupId=${groupId} \
  -Dwanted.artifactId=${artifactId} \
  -Dwanted.version=${version}