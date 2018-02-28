name 'web'
description 'Web setup'

run_list 'recipe[app-redis]',
         'recipe[app-ruby]',
         'recipe[app-nodejs]',
         'recipe[app-imagemagick]',
         'recipe[app-nginx]'
