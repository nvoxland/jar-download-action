#!/bin/sh -l

mvn -B -f /builder.pom.xml  dependency:copy-dependencies -s /usr/share/maven/ref/settings-docker.xml "$@"