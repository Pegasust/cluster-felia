local default(vcpu=1, 
    disk="5G", 
    mem="2G",
    networks=[],
    cloud_init=""
) = {
    "vcpu": vcpu,
    "disk": disk,
    "mem": mem,
    "networks": networks,
    "cloud_init": cloud_init
};

{
    "vm_templates": {
        "default": default(),
        "microk8s-worker": default(
            vcpu=2,
            disk="10G",
            cloud_init="microk8s-worker.yaml"
        ),
        "microk8s-master": default(
            vcpu=2,
            disk="20G",
            mem="3G",
            cloud_init="microk8s.yaml",
            networks=[
                {
                    "name": "Guest OS to Host OS",
                    "mode": "auto"
                }
            ],
        ),
        "microk8s-fel-master": default(
            vcpu=2,
            disk="20G",
            mem="3G",
            cloud_init="microk8s.yaml",
            networks=[
                {
                    "name": "eth0",
                    "mode": "auto"
                },
            ],
        )
    }
}