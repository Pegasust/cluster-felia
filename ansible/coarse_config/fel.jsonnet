local config = import 'cluster_config.libsonnet';

config.output (
  config.coarse("microk8s-fel-master", name="microk8s-master")
, state="deleted"
)
