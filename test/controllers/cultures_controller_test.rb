require 'test_helper'

class CulturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
  end

  # test "should get index" do
  #   get cultures_index_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get cultures_new_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get cultures_create_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get cultures_update_url
  #   assert_response :success
  # end

  # test "should get delete" do
  #   get cultures_delete_url
  #   assert_response :success
  # end
end
