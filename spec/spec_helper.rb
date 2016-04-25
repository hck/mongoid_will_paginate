require 'rubygems'

require 'rails'
require 'mongoid'
require 'will_paginate'
require 'mongoid_will_paginate'

require 'rails_app'
require 'rspec/rails'

Mongoid.configure do |config|
  config.connect_to 'test_mongoid_will_paginate'
end

Mongoid.logger.level = Logger::ERROR
Mongo::Logger.logger.level = Logger::ERROR

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true

  config.example_status_persistence_file_path = 'spec/examples.txt'

  config.disable_monkey_patching!

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed

  config.before(:each) do
    Mongoid.default_client.collections.select { |c| c.name !~ /system/ }.each(&:drop)
  end
end
