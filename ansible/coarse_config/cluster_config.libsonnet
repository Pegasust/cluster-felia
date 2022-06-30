// this library makes the cluster configuration looks like this:
// output(coarse("temp0", 3) + coarse(template="temp1", replicas=2) + fine(...))

// overriding so that all vms are deleted looks like this:
// output (
//   coarse("temp0", 3)
// + coarse("temp1", 2)
// + fine_grain({...})
// , state="deleted"
// )
local templates = import 'templates.jsonnet';

{
	coarse(template, replicas=1, state="running")::
		{
			[template + v]:
				templates.vm_templates[template]
				+ {"state": state}
			for v in std.range(0, replicas)
		},
	fine_grain(obj):: obj,
	output(all_fine_grained, state=null)::
		// override states if state is not null.
		local _all_fine_grain = {
			[name]: local value = all_fine_grained[name];
				value + {
					"state": if state == null then 
						std.get(value, "state") 
					else state
				}
			for name in std.objectFields(all_fine_grained)
		};
		{
			"multipass_vm_instances": [
					{"name": name} + _all_fine_grain[name]
					for name in std.objectFields(_all_fine_grain)
				]
		},
		
}