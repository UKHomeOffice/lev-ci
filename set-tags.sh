#!/bin/bash

echo "${VERSION}-${DRONE_BUILD_NUMBER}-${DRONE_COMMIT:0:10},${VERSION},${MAJOR}-${MINOR},${MAJOR},latest" > .tags
