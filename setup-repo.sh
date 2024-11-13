#!/bin/bash

cd ./original_e4l

git init

git remote add origin http://192.168.56.9/gitlab/user/e4l

git add .

git commit -m "initial commit"

git push http://user:us3rus3r@192.168.56.9/gitlab/user/e4l
