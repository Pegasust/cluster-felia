#!/usr/bin/env bash

to_yaml() {
  TEMP=$(mktemp)
	echo "# Managed by Jsonnet. See \$ROOT/coarse_config/$1" >$TEMP
	# to_yaml src.jsonnet dest.yml
	yq e -P <(jsonnet $1) >>$TEMP
  DIFF=$(sdiff -bBWs $TEMP $2)
  if [[ $? -eq 0 ]]; then
    echo "${2}: OK, no difference"
  else
    cp $TEMP $2
	  echo "${2}: OK, changed:"
    echo "$DIFF"
  fi
}

to_yaml fel.jsonnet ../host_vars/fel.yml
to_yaml felia.jsonnet ../host_vars/felia.yml
to_yaml templates.jsonnet ../roles/multipass/defaults/main/vm-templates.yml
