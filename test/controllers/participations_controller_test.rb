require 'test_helper'

class ParticipationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get participations_show_url
    assert_response :success
  end

end
