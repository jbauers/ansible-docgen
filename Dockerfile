FROM python:3.7-alpine

RUN apk add --no-cache \
    git

#RUN git clone https://github.com/jbauers/ansible-docgen.git
COPY . .
RUN python setup.py install

RUN mkdir /ansible
WORKDIR /ansible

CMD ["sh","-c","ansible-docgen -p ."]
