#!/bin/bash

[[ -z "${VERSION}" ]] && source get-package-details
echo "${FULL_VERSION},${VERSION},${MAJOR}.${MINOR},${MAJOR},latest" > .tags
