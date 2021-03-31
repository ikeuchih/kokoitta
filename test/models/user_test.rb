require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: "Hinano", email: "hinano@example.com" )
  end
  
  test "should be valid" do
    assert_not @user.valid?
  end
  # いったんassert_notにしている！
  
end
