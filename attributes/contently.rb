default['postgresql']['pg_hba'] = [
  {:type => 'host',  :db => 'all', :user => 'all', :addr => '127.0.0.1/32',  :method => 'md5'},
  {:type => 'host',  :db => 'all', :user => 'all', :addr => '::1/128',       :method => 'md5'},
  {:type => 'local', :db => 'all', :user => 'postgres', :addr => nil,             :method => 'peer'},
  {:type => 'host',  :db => 'all', :user => 'postgres', :addr => '127.0.0.1/32',  :method => 'md5'},
  {:type => 'host',  :db => 'all', :user => 'postgres', :addr => '::1/128',       :method => 'md5'}
]
