# Devops project

### How to start the vms:
> vagrant up
> vagrant provision --provision-with ansible

### How to lint the playbook:
> ansible-lint playbook


### How to print values in the playbook for debugging:
Add this to playbook:

> - name: Register variable
>   command: whoami
>   register: xxx
>
> - name: Print user
>   debug:
>     msg: "This is the user: {{ xxx.stdout }}"

## Registry commands (replace localhost by vm address if outside the vm):
### How to login and logout
> docker login localhost:5000 and enter admin and password
> docker logout

### How to tag and push
> docker pull alpine:latest
> docker tag alpine:latest localhost:5000/myalpine
> docker push localhost:5000/myalpine

### How to get repo list
> curl -u admin:password -v -X GET https://192.168.33.8:5000/v2/_catalog -k
