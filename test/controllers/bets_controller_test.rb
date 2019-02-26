require 'test_helper'

class BetsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bets_create_url
    assert_response :success
  end

end
