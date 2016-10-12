include_recipe 'desktop::slack'

delete_resource(:package, 'systemd, ifupdown')
