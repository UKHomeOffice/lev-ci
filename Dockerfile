FROM ubuntu:20.04

ENV KUBECTL_VERSION=1.19.15
ENV DEBIAN_FRONTEND noninteractive
ENV NODE_VERSION=12

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  bash \
  ca-certificates \
  coreutils \
  curl \
  docker.io \
  gettext \
  git \
  grep \
  jq \
  make \
  npm \
  openssl \
  wget \
  python3-pip \
  python3-paramiko \
  python3 \
  sed

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - && \
  	apt-get install -y nodejs
RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade pip
RUN pip3 install -q docker-compose

COPY get-package-details.sh /usr/bin/get-package-details
COPY set-tags.sh /usr/bin/set-tags

RUN wget -q "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -O "/usr/bin/kubectl" \
 && chmod +x "/usr/bin/kubectl" \
 && printf '\nsource /usr/bin/get-package-details\n' >> /root/.bashrc

CMD ["bash"]
