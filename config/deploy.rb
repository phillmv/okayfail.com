# require "bundler/capistrano"
# require "rvm/capistrano"
# set :rvm_ruby_string, 'ruby-1.9.3'
# set :rvm_type, :user
puts "LOL"
set :application, "okayfail.com"
set :repo_url,  "git@github.com:phillmv/okayfail.com.git"
# set :use_sudo, false
# set :scm, :git
# ssh_options[:forward_agent] = true
# default_run_options[:pty] = true

set :deploy_to, "/var/www/#{fetch(:application)}"
set :chruby_ruby, "ruby-2.3.3"
set :user, "deploy"
role :web, "okayfail.com"

namespace :deploy do
  task :bundle do
    on roles(:web) do
      execute " source /usr/local/share/chruby/chruby.sh && chruby 2.3 && cd #{current_path} && bundle install"
    end
  end
  task :run_middleman do
    on roles(:web) do
      execute " source /usr/local/share/chruby/chruby.sh && chruby 2.3 && cd #{current_path} && bundle exec middleman build"
    end
  end
end


after "deploy:log_revision", "deploy:run_middleman"

# namespace :deploy do
#   task :bundle do
#     run "cd #{current_path} && bundle install"
#   end
#   task :run_jekyll do
#     run "cd #{current_path} && bundle exec jekyll"
#   end
# end
# 
# after "deploy:restart", "deploy:run_jekyll"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

