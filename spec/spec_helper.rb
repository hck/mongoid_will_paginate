require 'rubygems'
require 'bundler/setup'

require 'rails'
require 'mongoid'
require 'will_paginate'
require 'mongoid_will_paginate'

require File.join(File.dirname(__FILE__), 'rails_app')
require 'rspec/rails'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec
  config.before :each do
    Mongoid.master.collections.select{|c| c.name !~ /system/}.each(&:drop)
  end
end

Mongoid.configure{|c| c.master = Mongo::Connection.new.db("test_mongoid_will_paginate")}
