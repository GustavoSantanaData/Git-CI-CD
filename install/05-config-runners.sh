#!/bin/bash

# Ingressar o Runner em modo shell no GitLab
# Se estiver utilizando gitlab.com ou certificado, altere para HTTPS://
sudo gitlab-runner register -n \
  --url http://<seu-ip>:8080 \
  --registration-token GR1348941w5eCWTWhMTxorW_RB4Qu \
  --executor shell \
  --description "Runner Shell"

# Criar o container gitlab-runner para Docker
# Se estiver utilizando gitlab.com ou certificado, altere para HTTPS://
docker run -dit \
  --name runner-docker \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /opt/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:ubuntu-v14.9.1

# Ingressar o Runner em modo docker no GitLab
# Se estiver utilizando gitlab.com ou certificado, altere para HTTPS://
docker exec -it runner-docker \
gitlab-runner register -n \
  --url http://<seu-ip>:8080/ \
  --registration-token GR1348941w5eCWTWhMTxorW_RB4Qu \
  --clone-url http://<seu-ip>:8080/ \
  --executor docker \
  --docker-image "docker:latest" \
  --docker-privileged


