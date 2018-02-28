users_manage node['operator'] do
  group_id 2300
  action :create
end

users_manage node['deployer'] do
  group_id 2301
  action :create
end
