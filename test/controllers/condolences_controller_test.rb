require 'test_helper'

class CondolencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get condolences_new_url
    assert_response :success
  end

  test "should get create" do
    get condolences_create_url
    assert_response :success
  end

end
