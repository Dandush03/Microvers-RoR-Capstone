require 'test_helper'

class FallowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

	test "should post create" do
		user = users(:user_002)
    post followings_path, params: { followed_id: user.id } 
    assert_response :success
	end

	test "should delete" do
		user = users(:user_002)
    delete  following_path(user), params: { friend: user.id } 
    assert_response :success
	end
	
end
