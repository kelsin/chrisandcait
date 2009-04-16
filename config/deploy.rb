set :application, "chrisandcait"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm, :git
set :repository,  "kelsin@www.chrisandcait.com:~/repos/chrisandcait.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :user, 'kelsin'
set :ssh_options, { :forward_agent => true }
 
role :app, "www.chrisandcait.com"
role :web, "www.chrisandcait.com"
role :db,  "www.chrisandcait.com", :primary => true

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_release}/tmp/restart.txt"
  end
end
