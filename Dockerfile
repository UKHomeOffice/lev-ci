FROM quay.io/ukhomeofficedigital/kd:v0.2.4

RUN apk add -q --no-cache \
  coreutils \
  docker \
  grep \
  jq
