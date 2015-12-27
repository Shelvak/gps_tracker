require 'test_helper'

class LocationsControllerTest < ActionController::TestCase

  setup do
    @location = Fabricate(:location)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
    assert_select '#unexpected_error', false
    assert_template "locations/index"
  end
end
