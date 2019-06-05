#!/bin/bash

package=${1:-package.json}

if [ -f ${package} ] ; then
  export VERSION=`cat ${package} | jq -r '.version'`
  export MAJOR=`echo -n "${VERSION}" | awk -F '.' '{print $1}'`
  export MINOR=`echo -n "${VERSION}" | awk -F '.' '{print $2}'`
  export PATCH=`echo -n "${VERSION}" | awk -F '.' '{print $3}'`
fi
