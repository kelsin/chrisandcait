require 'bundler/capistrano'

set :application, "chrisandcait"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "~/apps/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm, :git
set :repository,  "kelsin@www.chrisandcait.com:~/repos/chrisandcait.git"
set :branch, "master"
set :deploy_via, :remote_cache

set :use_sudo, false
set :user, 'kelsin'
set :ssh_options, { :forward_agent => true }

role :app, "stalker.kelsin.net"
role :web, "stalker.kelsin.net"
role :db,  "stalker.kelsin.net", :primary => true

namespace :deploy do
  task :start, :roles => :app do
  end

  task :stop, :roles => :app do
  end

  task :restart, :roles => :app do
  end
end
