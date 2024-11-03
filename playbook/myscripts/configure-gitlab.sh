#!/bin/bash

sudo sed -i.bak "s+external_url 'http://gitlab.example.com'+external_url 'http://192.168.56.9/gitlab'+g" /etc/gitlab/gitlab.rb

sudo sed -i.bak "s+# puma\['port'\] = 8080+puma\['port'\] = 8088+g" /etc/gitlab/gitlab.rb

sudo gitlab-ctl reconfigure
sudo gitlab-ctl restart puma
sudo gitlab-ctl restart

sudo gitlab-rails runner /tmp/myscripts/gitlab-set-root-password.rb
sudo gitlab-rails runner /tmp/myscripts/gitlab-user-create.rb > $PAT

export PAT
echo "Configured gitlab!"
