# Global attributes ------------------------------------------------------------

default['deployer'] = 'deployer' # It depends on users mentioned in data bags
default['operator'] = 'sysadmin' # It depends on users mentioned in data bags

# Deploy -----------------------------------------------------------------------

override['project']['name'] = 'project_name'
override['project']['repository'] = 'git@github.com:user/project.git'

# Postgresql -------------------------------------------------------------------

override['postgresql']['version'] = '9.6'
override['postgresql']['deployer']['encrypted_password'] = 'md5f62fee1b43f48bd0c1bf9b7d5b22f270' # the password is "deployer"
override['postgresql']['operator']['encrypted_password'] = 'md59d127ff383d595262c67036f50493133' # the password is "sysadmin"

# Locale -----------------------------------------------------------------------

override['locale']['lang'] = 'en_US.utf8'
override['locale']['lc_all'] = node['locale']['lang']
