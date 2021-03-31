require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "kokoitta!"
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end
  # ルートの設定あってるよね
  
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end
  # ホーム画面表示されてるよね
  # タイトル表示されてるよね

  test "should get help" do
    get help_path
    assert_response :success
    # assert_select "title", "Help | #{@base_title}"
  end
  # ヘルプ画面表示されてるよね
  # タイトル表示されてるよね

  
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  # アバウト画面表示されてるよね
  # タイトル表示されてるよね

end
