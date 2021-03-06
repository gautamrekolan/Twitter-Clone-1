require 'deprec'
  
set :application, "status"
set :domain, "174.143.171.18"
set :repository,  "git@github.com:natemartinsf/Twitter-Clone.git"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
   
set :ruby_vm_type,      :ree        # :ree, :mri
set :web_server_type,   :apache     # :apache, :nginx
set :app_server_type,   :passenger  # :passenger, :mongrel
set :db_server_type,    :mysql      # :mysql, :postgresql, :sqlite


set :db_name, "rails"
set :db_user, "root"
set :db_password, ""

# set :packages_for_project, %w(libmagick9-dev imagemagick libfreeimage3) # list of packages to be installed
 set :gems_for_project, %w(authlogic) # list of gems to be installed

# Update these if you're not running everything on one host.
role :app, domain
role :web, domain
role :db,  domain, :primary => true, :no_release => true

# If you aren't deploying to /opt/apps/#{application} on the target
# servers (which is the deprec default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/opt/apps/#{application}"

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    top.deprec.app.restart
  end
end