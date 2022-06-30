local config = import 'cluster_config.libsonnet';

config.output(
  config.coarse("microk8s-worker", 3)
+ config.coarse("microk8s-master", 2)
+ config.fine_grain({})
, state="running"
)
