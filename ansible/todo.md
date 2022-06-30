# TODO

## List

01 Smart config: Remember the last configuration, delete the instances no longer mentioned from the last config file

02 Ansible Tasks: Migrate to jsonnet for multi-platform

## Done

xx Windows: there is no default path, need to use something like `C:\Temp\...`

- Use `"{{ ansible_env.TEMP|default('.')}}/{{item.name}}"`
- `default('.')` is necessary because Linux doesn't have this env.

xx Multipass: 'deleted' state not supported

## Code dump
