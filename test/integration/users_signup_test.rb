require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { username: "",
                                         email: "user@invalid",
                                         password: "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'registrations/new'
  end
  # 無効なユーザーを作成してみた
  # カウントしても何の変更もないよね
  # もう一回サインアップフォームに戻るよね
  
  
  test "valid signup information" do
    get new_user_registration_path
    assert_no_difference 'User.count',1 do
      post users_path, params: { user: { username: "exampleuser",
                                         email: "user@invalid",
                                         password: "foobar",
                                         password_confirmation: "foobar" } }
    end
    # follow_redirect!
    # assert_template 'users/show'
  end
    
  

end

