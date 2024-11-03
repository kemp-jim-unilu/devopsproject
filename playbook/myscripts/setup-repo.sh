#!/bin/bash

# change owner of the repo to vagrant
sudo chown -R vagrant /home/vagrant/therepo/

curl --header "PRIVATE-TOKEN: $PAT" -X POST "http://192.168.56.9/gitlab/api/v4/projects?name=MavenHelloWorldProject"

cd /home/vagrant/therepo
git init
git remote add origin http://192.168.56.9/gitlab/user/MavenHelloWorldProject

git config --global user.name "user"
git config --global user.email "user@gmail.com"

echo '/target

*log

.settings' > .gitignore

git add .
git commit -m 'Initial commit'
git push http://user:r00tr00t@192.168.56.9/gitlab/user/MavenHelloWorldProject master

echo "Finshed setup..."
