role :app, "llkinformatica"

set :use_sudo, false

set :application, "SIGNUS"

set :repository,  "."

set :scm, :none

set :deploy_to, "/var/www/rails_apps/signus"
set :deploy_via, :copy
set :user, "passenger"


# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   desc "Reiniciando a aplicação"
   task :start, :roles => :app do
     run "touch #{current_path}/tmp/restart.txt"
   end
   task :restart do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end

