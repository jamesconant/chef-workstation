include_recipe 'desktop::nvidia'

delete_resource(:package, 'systemd, ifupdown')
