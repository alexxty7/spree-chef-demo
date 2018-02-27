name 'setup'
description 'Basic setup'

run_list 'recipe[app-hostname]',
         'recipe[app-swap-tuning]',
         'recipe[app-users]',
         'recipe[app-sudo]'