#!/bin/sh

ANSIBLE=/ansible
TERRAFORM=/terraform

ansible-docgen -p ${ANSIBLE}

exec terraform-docs markdown document "${TERRAFORM}" > "${@}"
