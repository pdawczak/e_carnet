# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

Rails::TestTask.new("test:features" => "test:prepare") do |t|
  t.pattern = "test/features/**/*_test.rb"
end

Rails::TestTask.new("test:app" => "test:prepare") do |t|
  t.pattern = "test/e_carnet_app/**/*_test.rb"
end

Rails::TestTask.new("test:models" => "test:prepare") do |t|
  t.pattern = "test/models/**/*_test.rb"
end

Rails::TestTask.new("test:controllers" => "test:prepare") do |t|
  t.pattern = "test/controllers/**/*_test.rb"
end
