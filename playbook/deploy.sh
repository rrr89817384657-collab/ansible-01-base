#!/bin/bash

docker rm -f centos7 ubuntu fedora 2>/dev/null

docker run -d --name centos7 centos:7 tail -f /dev/null
docker run -d --name ubuntu python:3.9-slim tail -f /dev/null  
docker run -d --name fedora pycontribs/fedora:latest tail -f /dev/null
docker exec centos7 yum install -y python3
ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
docker stop centos7 ubuntu fedora
