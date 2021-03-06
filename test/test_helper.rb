ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  def log_in( user )
    if integration_test?
      #use warden helper
      login_as(user, :scope => :user)
    else #controller_test, model_test
      #use devise helper
      sign_in(user)
    end
  end

  # 統合テスト内ではtrueを返す
  def integration_test?
    defined?(post_via_redirect)
  end
end



# class ActiveSupport::TestCase
# #   # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
#   fixtures :all

# #   # Add more helper methods to be used by all tests here...
# end
