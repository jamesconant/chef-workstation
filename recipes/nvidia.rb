include_recipe 'desktop::nvidia'

delete_resource(:package, 'systemd, ifupdown')
# delete_resource(:package, 'ifupdown')
