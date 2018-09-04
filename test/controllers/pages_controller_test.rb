require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get articles" do
    get pages_articles_url
    assert_response :success
  end

end
