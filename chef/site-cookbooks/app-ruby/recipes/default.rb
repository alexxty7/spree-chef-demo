deployer = node['deployer']

execute 'add gpg2 key' do
  environment ({
    'HOME' => "/home/#{deployer}",
    'USER' => deployer
  })
  command 'command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -'
end

execute 'chown ~/.gnupg' do
  command "chown -R #{deployer}:#{deployer} /home/#{deployer}/.gnupg"
  user 'root'
end

chef_rvm 'install rubies' do
  rubies node['ruby']['versions']
  rvmrc(rvm_autoupdate_flag: 1)
  user deployer
end

chef_rvm_ruby 'set default ruby version' do
  version node['ruby']['default']
  patch 'falcon'
  default true
  user deployer
end
