#!/bin/bash

package=${1:-package.json}

if [ -f ${package} ] ; then
  export VERSION=`cat ${package} | jq -r '.version'`
  export MAJOR=`echo -n "${VERSION}" | awk -F '.' '{print $1}'`
  export MINOR=`echo -n "${VERSION}" | awk -F '.' '{print $2}'`
  export PATCH=`echo -n "${VERSION}" | awk -F '.' '{print $3}'`
  export FULL_VERSION="${VERSION}-${DRONE_BUILD_NUMBER}-${DRONE_COMMIT:0:10}"
fi
