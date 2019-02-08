FROM python:3.7-alpine

ARG VERSION=0.6.0

RUN apk add --no-cache \
    git \
    wget

RUN wget https://github.com/segmentio/terraform-docs/releases/download/v${VERSION}/terraform-docs-v${VERSION}-linux-amd64 \
  && mv terraform-docs-v${VERSION}-linux-amd64 /usr/bin/terraform-docs \
  && chmod a+x /usr/bin/terraform-docs

#RUN git clone https://github.com/jbauers/ansible-docgen.git
COPY . .
RUN python setup.py install

ENV ANSIBLE /ansible
ENV TERRAFORM /terraform

CMD ["sh","-c","ansible-docgen -p ${ANSIBLE} && terraform-docs markdown table ${TERRAFORM} > /terraform/MODULE.md"]
