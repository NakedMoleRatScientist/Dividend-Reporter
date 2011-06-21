require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
  end
end

def make_users 
  admin = User.create!(:username => "user", :email => "example@example.org", :password => "foobar", :password_confirmation => "foobar")
  admin.toggle!(:admin)
end
