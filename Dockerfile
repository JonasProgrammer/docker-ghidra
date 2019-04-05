FROM debian:stretch

ARG GHIDRA_DOWNLOAD=https://www.ghidra-sre.org/ghidra_9.0.2_PUBLIC_20190403.zip
ARG GHIDRA_HASH=10ffd65c266e9f5b631c8ed96786c41ef30e2de939c3c42770573bb3548f8e9f

RUN adduser --gecos '' --disabled-login --disabled-password ghidra \
 && apt-get update \
 && apt-get install --no-install-recommends -y i3 zip curl openssh-server \
 && rm -rf /var/lib/apt/lists/* \
 && echo "$GHIDRA_HASH *-" > /tmp/ghidra.sum \
 && curl -o - $GHIDRA_DOWNLOAD | tee /tmp/ghidra.zip | sha256sum --check /tmp/ghidra.sum -b - \
 && mkdir -p /home/ghidra/ghidra \
 && cd /home/ghidra/ghidra \
 && unzip /tmp/ghidra.zip \
 && rm /tmp/ghidra.*

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd", "-D"]
