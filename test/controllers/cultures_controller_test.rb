require 'test_helper'

class CulturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  test 'should get index' do
    get root_path
    assert_response :success
  end

  test 'should show' do
    user = users(:user_001)
    get culture_path(user)
    assert_response :success
  end

  test 'should post create' do
    text = 'this is a sample test'
    post cultures_path, params: { culture: { text: text } },
                        headers: { 'HTTP_REFERER' => 'http://www.example.com/' }
    get root_path
    assert_response :success
  end
end
