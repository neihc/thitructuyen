require 'test_helper'

class UserExamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_exams_new_url
    assert_response :success
  end

  test "should get create" do
    get user_exams_create_url
    assert_response :success
  end

end
