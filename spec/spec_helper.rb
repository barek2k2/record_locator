require 'rubygems'
require 'bundler/setup'
require "yaml"
require 'active_record'
require 'active_support'

RSpec.configure do |config|
  ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ':memory:')
  load "spec/schema.rb"
  ActiveRecord::Base.connection
end