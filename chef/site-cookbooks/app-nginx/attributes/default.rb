include_attribute 'nginx::source'

source = node['nginx']['source']

override['nginx']['install_method'] = 'source'
override['nginx']['version'] = source['version']
override['nginx']['source']['prefix'] = "/opt/nginx-#{source['version']}"
override['nginx']['source']['sbin_path'] = "#{source['prefix']}/sbin/nginx"
override['nginx']['binary'] = source['sbin_path']
override['nginx']['default_site_enabled'] = false
