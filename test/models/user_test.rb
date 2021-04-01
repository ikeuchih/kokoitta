# require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # include Devise::TestHelpers
  include Warden::Test::Helpers

  def setup
    @user = User.new(username: "Hinano", email: "hinano@example.com", password:"hinano0313" )
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  # signinできているテスト
 
  
  # def signup
  #   sign_up(@user)
  # end
  
  # def test_new
  #     @user = users( :hinano )
  #     sign_in(@user) #追加
  #     get new_post_path
  #     assert_response :success
  # end
  # # signupできているテスト
  
end

