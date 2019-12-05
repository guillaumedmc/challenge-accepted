require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get challenge_list" do
    get pages_challenge_list_url
    assert_response :success
  end

end
