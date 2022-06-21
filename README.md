# Cluster Felia

This repository contains how the cluster Felia is deployed

## Goals

Felia should be able to orchestrate the cluster using VM technology

Felia should have these technology be running in the background:

- Kubernetes
- Docker registry
- Cloud storage
- Self-hosted GitLab

## Troubleshooting guides

- If using Windows as the Ansible host, running this in WSL
works most of the time.

### Setting up OpenSSH server on Windows 10 with public key authentication

- There are many pitfalls when configuring public key authentications
- Consule the attached resources in case problems arise.

#### Resources

[stackoverflow: setting up openssh for windows with pub key auth](https://stackoverflow.com/questions/16212816/setting-up-openssh-for-windows-using-public-key-authentication)

[Ansible: Windows setup](https://docs.ansible.com/ansible/latest/user_guide/windows_setup.html)

