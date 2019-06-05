#!/bin/bash

export VERSION=`cat package.json | jq -r '.version'`
export MAJOR=`echo -n "${VERSION}" | awk -F '.' '{print $1}'`
export MINOR=`echo -n "${VERSION}" | awk -F '.' '{print $2}'`
export PATCH=`echo -n "${VERSION}" | awk -F '.' '{print $3}'`
