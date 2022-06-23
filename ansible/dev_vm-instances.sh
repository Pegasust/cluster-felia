#!/usr/bin/env bash
ansible-playbook -v --check -i inventory/homelab.ini plays/cluster-setup_fine-grain.example.yml