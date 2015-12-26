require 'test_helper'

class DevicesControllerTest < ActionController::TestCase

  setup do
    @device = Fabricate(:device)
    @user = Fabricate(:user)
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
    assert_select '#unexpected_error', false
    assert_template "devices/index"
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:device)
    assert_select '#unexpected_error', false
    assert_template "devices/new"
  end

  test "should create device" do
    assert_difference('Device.count') do
      post :create, device: Fabricate.attributes_for(:device)
    end

    assert_redirected_to device_url(assigns(:device))
  end

  test "should show device" do
    get :show, id: @device
    assert_response :success
    assert_not_nil assigns(:device)
    assert_select '#unexpected_error', false
    assert_template "devices/show"
  end

  test "should get edit" do
    get :edit, id: @device
    assert_response :success
    assert_not_nil assigns(:device)
    assert_select '#unexpected_error', false
    assert_template "devices/edit"
  end

  test "should update device" do
    put :update, id: @device,
      device: Fabricate.attributes_for(:device, identifier: 'value')
    assert_redirected_to device_url(assigns(:device))
  end

  test "should destroy device" do
    assert_no_difference 'Device.count' do
      delete :destroy, id: @device
    end

    assert_redirected_to devices_url
  end
end
