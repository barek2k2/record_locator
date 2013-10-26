require 'rubygems'
require 'bundler/setup'
require "yaml"
require 'active_record'

RSpec.configure do |config|
  database_yml = File.expand_path('../database.yml', __FILE__)
  active_record_configuration = YAML.load_file(database_yml)

  driver_name = 'mysql'
  ActiveRecord::Base.configurations = active_record_configuration
  config = ActiveRecord::Base.configurations[driver_name]

  ActiveRecord::Base.establish_connection(driver_name)
  ActiveRecord::Base.connection

end