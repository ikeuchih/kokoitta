require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:hinano)
    @micropost = @user.microposts.build(content: "testtest")
  end
  
  
  test "should be valid" do
    assert @micropost.valid?
  end
  # マイクロポスト存在してるよね？
  
  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end
  # ユーザーIDが存在しない場合、マイクロポストできないよね？
  
  test "content should be present" do
    @micropost.content = "  "
    assert_not @micropost.valid?
  end
  # コンテンツが空白の場合、マイクロポストできないよね？
  
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
  # マイクロポストは順番通り並んでるよね
  
  
  
  
end
