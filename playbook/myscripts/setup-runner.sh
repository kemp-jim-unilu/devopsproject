#!/bin/bash

curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | sudo bash
sudo apt-get install gitlab-runner

token = $(sudo gitlab-rails runner -e production "puts Gitlab::CurrentSettings.current_application_settings.runners_registration_token")

sudo gitlab-runner register \
--non-interactive \
--url "http://192.168.56.9/" \
--registration-token "$token" \
--description "docker" \
--tag-list "integration" \
--executor "docker" \
--docker-image alpine:latest \
--run-untagged="true"

echo "Finished runner setup!"

