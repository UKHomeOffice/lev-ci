FROM quay.io/ukhomeofficedigital/kd:v0.5.0

RUN apk add -q --no-cache \
  coreutils \
  curl \
  docker \
  git \
  grep \
  jq
