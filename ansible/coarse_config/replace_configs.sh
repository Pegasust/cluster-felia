#!/usr/bin/env bash

to_yaml {
    # to_yaml src.jsonnet dest.yml
    yq e -P <(jsonnet $1) >$2
}
to_yaml fel.jsonnet ../host_vars/fel.yml
to_yaml felia.jsonnet ../host_vars/felia.yml
to_yaml templates.jsonnet ../roles/multipass/defaults/main/vm-templates.yml
