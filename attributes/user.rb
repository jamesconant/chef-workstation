# id 1000 taken by chef user

default['desktop']['user'].tap do |user|
  user['name'] = 'jconant'
  user['uid'] = '1001'
  user['group'] = 'jconant'
  user['gid'] = '1001'
  user['home'] = '/home/jconant'
end
