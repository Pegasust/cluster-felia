local templates = import 'templates.jsonnet';

local config(template, replicas=1, state="running") = 
    {
        [template + v]: 
            templates.vm_templates[template] +
            {"state": state}
        for v in std.range(0, replicas)
    };

local coarse_grain = config("microk8s-fel-master");

// format: 
// name:
//   vcpu: 2
//   disk: 20G
//   ...
local fine_grain = {

};

local _all_fine_grain = fine_grain + coarse_grain;

local output = [
    {"name": name} + _all_fine_grain[name],
    for name in std.objectFields(_all_fine_grain)
];
{"multipass_vm_instances": output}
