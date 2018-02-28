# Global attributes ------------------------------------------------------------

default['deployer'] = 'deployer' # It depends on users mentioned in data bags
default['operator'] = 'sysadmin' # It depends on users mentioned in data bags

# Deploy -----------------------------------------------------------------------

override['project']['name'] = 'project_name'
override['project']['repository'] = 'git@github.com:user/project.git'