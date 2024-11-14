# Devops project

### How to setup the pipeline:
> sh vagrantup.sh
After it is done initialize and push the repo with:
> sh setup-repo.sh
The repository with the product is in ./original_e4l.

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

After logging in with user, the pipeline should run and the product website is accessible via http://192.168.56.9:8884/

### The private docker registry:

Username: admin
password: password
Address: https://192.168.33.8:5000
