#!/usr/bin/env bash
ansible-playbook -v --check -i inventory/homelab.ini cluster-setup_fine-grain.example.yml