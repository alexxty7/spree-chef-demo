users = search(:users, 'groups:sudo').map(&:id)
operator = node['operator']

node.override['authorization']['sudo']['passwordless'] = true
node.override['authorization']['sudo']['groups'] = ['wheel', operator].concat(users)
node.override['authorization']['sudo']['users'] = users

include_recipe 'sudo'
