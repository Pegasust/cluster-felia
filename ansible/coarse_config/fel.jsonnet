local config = import 'cluster_config.libsonnet';

config.output (
  config.coarse("microk8s-fel-master")
, state="running"
)
