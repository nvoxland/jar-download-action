#!/bin/sh -l

mvn -f /builder.pom.xml  dependency:copy-dependencies -s /usr/share/maven/ref/settings-docker.xml "$@"