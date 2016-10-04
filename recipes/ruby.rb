include_recipe 'desktop::ruby'

node.default[:rbenv][:rubies] = ['2.3.0']
