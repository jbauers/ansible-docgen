FROM python:3.7-alpine

ARG TF_DOCS_VERSION=0.6.0

RUN apk add --no-cache \
    git \
    wget

RUN wget https://github.com/segmentio/terraform-docs/releases/download/v${TF_DOCS_VERSION}/terraform-docs-v${TF_DOCS_VERSION}-linux-amd64 \
  && mv terraform-docs-v${TF_DOCS_VERSION}-linux-amd64 /usr/bin/terraform-docs \
  && chmod a+x /usr/bin/terraform-docs

#RUN git clone https://github.com/jbauers/ansible-docgen.git
COPY . .
RUN python setup.py install

ENV TERRAFORM /terraform

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["/terraform/module.md"]
