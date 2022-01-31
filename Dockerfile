FROM ubuntu:18.04

ENV KUBECTL_VERSION=1.19.15

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y \
  bash \
  ca-certificates \
  coreutils \
  curl \
  docker \
  gettext \
  git \
  grep \
  jq \
  make \
  nodejs \
  npm \
  openssl \
  wget \
  python3-pip \
  python3-paramiko \
  python3 \
  sed
RUN apt-get upgrade -y

RUN pip3 install --upgrade setuptools
RUN pip3 install --upgrade pip
RUN pip3 install -q docker-compose

RUN apt-get upgrade -y

COPY get-package-details.sh /usr/bin/get-package-details
COPY set-tags.sh /usr/bin/set-tags

RUN wget -q "https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl" -O "/usr/bin/kubectl" \
 && chmod +x "/usr/bin/kubectl" \
 && printf '\nsource /usr/bin/get-package-details\n' >> /root/.bashrc

CMD ["bash"]
