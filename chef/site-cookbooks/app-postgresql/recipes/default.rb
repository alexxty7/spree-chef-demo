include_recipe 'locale'
include_recipe 'postgresql_lwrp::apt_official_repository'
include_recipe 'postgresql_lwrp'

version = node['postgresql']['defaults']['server']['version']
operator = node['postgresql']['operator']
deployer = node['postgresql']['deployer']
database = node['postgresql']['database']['name']
environment = node.environment

postgresql 'main' do
  cluster_version version
  cluster_create_options(locale: node['locale']['lang'])
  configuration(max_connections: 300)
  hba_configuration(
    [
      { type: 'local', database: 'all', user: 'postgres', address: '',             method: 'trust' },
      { type: 'local', database: 'all', user: 'all',      address: '',             method: 'trust' },
      { type: 'host',  database: 'all', user: 'all',      address: '127.0.0.1/32', method: 'trust' },
      { type: 'host',  database: 'all', user: 'all',      address: '::1/128 ',     method: 'trust' }
    ]
  )
end

postgresql_user operator[:name] do
  in_version version
  in_cluster 'main'
  encrypted_password operator[:encrypted_password]
  superuser true
end

postgresql_user deployer[:name] do
  in_version version
  in_cluster 'main'
  encrypted_password deployer[:encrypted_password]
  superuser false
end

postgresql_database deployer[:name] do
  in_version version
  in_cluster 'main'
  owner deployer[:name]
end

postgresql_database "#{database}_#{environment}" do
  in_version version
  in_cluster 'main'
  owner deployer[:name]
end
