ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "devise"

class ActiveSupport::TestCase
  # Run tests in parallel
  parallelize(workers: :number_of_processors, with: :threads)

  # Load all fixtures
  fixtures :all
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
