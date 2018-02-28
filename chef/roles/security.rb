name 'security'
description 'Security setup'

run_list 'recipe[app-openssh]',
         'recipe[app-firewall]'
