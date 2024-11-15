# Devops project
This file contains information relevant for the project submission.

Ansible version: 2.15.12
Vagrant version: 2.4.1

### Status of the project
The pipeline is not entirely finished:
- There is only one type of test.
- The test is only a dummy test, it does not do anything.
- The deployment runs in the same vm as the gitlab server.
- There are problems with the deployment of the backend, which is why only the frontend is visible.


### How to setup the pipeline:
Run this command at the root of the repo:
> sh vagrantup.sh
The task "Create project on CI server through gitlab API" is expected to fail.
After it is done initialize and push the repo with:
> sh setup-repo.sh
The repository with the product is in ./original_e4l.
Attention: If this has been cloned from github, it means that now there will be two .git dirs.
One is in the root of the cloned repo and the other one in ./original_e4l.
This could cause issues. In case of problems delete the .git from the cloned repo.

### How to completely destroy the pipeline:
> sh destroyvagrant.sh

### Where to change the adresses/ports:
If there is a conflict with the addresses or ports, then they have to be changed in:
- ./playbook/playbook.yml (multiple values have to be changed)
- ./playbook/roles/configure-registry-gitlab/tasks/main.yml
- ./original_e4l/.gitlab-ci.yml


### How to access gitlab server:
The server is on the address:
http://192.168.56.9/gitlab

Username: user
Password: us3rus3r
(The project will be under this user).

Root credentials(only needed for troubleshooting purposes):
Rootusername: root
Root Password: r00tr00t

After logging in with user, the project should be visible.
The pipeline should run without errors and the product website is accessible via http://192.168.56.9:8884/ on the local machine.

### The private docker registry:

Username: admin
password: password
Address: https://192.168.33.8:5000
