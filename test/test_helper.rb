ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/reporters"

Minitest::Reporters.use! [
  Minitest::Reporters::ProgressReporter.new,
  Minitest::Reporters::JUnitReporter.new(ENV["CIRCLE_TEST_REPORTS"] || "test/reports")
]

Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
