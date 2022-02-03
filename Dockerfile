FROM node:12

ENV KUBECTL_VERSION=1.19.15

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  bash \
  build-essential \
  ca-certificates \
  coreutils \
  curl \
  docker \
  docker-compose \
  gettext \
  git \
  grep \
  jq \
  libxml-xpath-perl \
  make \
  openssl \
  wget \
  python3-pip \
  python3-paramiko \
  python3 \
  sed

COPY get-package-details.sh /usr/bin/get-package-details
COPY set-tags.sh /usr/bin/set-tags

RUN wget -q "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -O "/usr/bin/kubectl" \
 && chmod +x "/usr/bin/kubectl" \
 && printf '\nsource /usr/bin/get-package-details\n' >> /root/.bashrc
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

CMD ["bash"]
