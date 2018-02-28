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

# Ruby ----------------------------------------------------------------------------------------------------------------

override['ruby']['versions'] = ['2.4.2']
override['ruby']['default'] = '2.4.2'

# Node.js ----------------------------------------------------------------------

# To obtain the checksum you can download the file and check it locally.
# $ shasum -a 256 node-vX.X.X.tar.gz

override['nodejs']['version'] = '9.3.0'
override['nodejs']['binary']['checksum'] = 'b7338f2b1588264c9591fef08246d72ceed664eb18f2556692b4679302bbe2a5'

# Nginx ---------------------------------------------------------------------------------------------------------------

# To obtain the checksum you can download the file and check it locally.
# $ shasum -a 256 nginx-X.XX.XX.tar.gz

override['nginx']['source']['version'] = '1.13.7'
override['nginx']['source']['checksum'] = 'beb732bc7da80948c43fd0bf94940a21a21b1c1ddfba0bd99a4b88e026220f5c'
