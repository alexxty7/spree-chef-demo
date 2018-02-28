include_recipe 'monit'

monit_config 'puma' do
  source 'puma.conf.erb'
  variables(
    project_root: node['project']['root'],
    deployer: node['deployer']
  )
end
