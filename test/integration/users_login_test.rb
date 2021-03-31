require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  
  test "login with invalid information" do
    get new_user_session_path
    assert_template 'sessions/new'
    post new_user_session_path, params: { session: { email: "", password: ""} }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  # ログイン用のパス⇒フォーム表示させる
  # 無効なユーザーをログインさせる
  # そしたらエラーメッセージが出るよね。。
  # ホームにもどったらメッセージ消えるよね
  
end
