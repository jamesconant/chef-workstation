default['desktop']['user'].tap do |user|
  user['name'] = 'jconant'
  user['uid'] = '1000'
  user['group'] = 'jconant'
  user['gid'] = '1001'
  user['home'] = '/home/jconant'
end
