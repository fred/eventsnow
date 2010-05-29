namespace :db do
  desc "Drop, Create, Migrate and Seed Database. All-in-1"
  task :refresh do
    `rake db:drop`
    `rake db:create`
    `rake db:migrate`
    `rake db:seed`
  end
end