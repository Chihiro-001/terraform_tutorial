FROM amazonlinux:2023

RUN dnf update -y \
   && dnf install -y --allowerasing curl jq awscli openssl python3 python3-pip \
   && pip3 install boto3 \
   && rm -rf /var/cache/dnf/* \
   && dnf clean all
