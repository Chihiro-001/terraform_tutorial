FROM amazonlinux:2023

RUN dnf update -y \
   && dnf install -y --allowerasing curl jq awscli openssl python3 python3-pip \ 
   && pip3 install boto3 awscli-local \ 
   && rm -rf /var/cache/dnf/* \ 
   && dnf clean all

# COPY ./src/ /usr/local/bin/

# RUN chmod +x /usr/local/bin/entrypoint.sh

# ENTRYPOINT /usr/local/bin/entrypoint.sh