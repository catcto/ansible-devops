# Ansible DevOps

This repository provides a Docker image for Ansible DevOps. The source is available on [GitHub](https://github.com/catcto/ansible-devops)⁠.

## Usage

1. Create `docker-compose.yml` file
```yaml
version: '3.1'
services:
  ansible-devops:
    image: catcto/ansible-devops:latest
    container_name: ansible-devops
    hostname: ansible-devops
    restart: always
    tty: true
    volumes:
      - /etc/hosts:/etc/hosts:ro
      - ${HOME}/.ssh:/root/.ssh:ro
      - ${HOME}/.bash_profile:/root/.bash_profile:ro
      - ${HOME}/my-ansible:/root/my-ansible
    working_dir: /root/my-ansible
```

2. Start the container:
```shell
$ docker-compose up -d
```

3. Enter the container:
```shell
$ docker exec -it ansible-devops zsh
```

4. Run Ansible:
```shell
$ ansible-inventory -i inventory.ini --list
```

This guide helps you set up and use the Ansible DevOps Docker image efficiently.