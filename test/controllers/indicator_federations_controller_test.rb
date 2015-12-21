require 'test_helper'

class IndicatorFederationsControllerTest < ActionController::TestCase
  setup do
    @indicator_federation = indicator_federations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicator_federations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicator_federation" do
    assert_difference('IndicatorFederation.count') do
      post :create, indicator_federation: { name: @indicator_federation.name, value: @indicator_federation.value }
    end

    assert_redirected_to indicator_federation_path(assigns(:indicator_federation))
  end

  test "should show indicator_federation" do
    get :show, id: @indicator_federation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicator_federation
    assert_response :success
  end

  test "should update indicator_federation" do
    patch :update, id: @indicator_federation, indicator_federation: { name: @indicator_federation.name, value: @indicator_federation.value }
    assert_redirected_to indicator_federation_path(assigns(:indicator_federation))
  end

  test "should destroy indicator_federation" do
    assert_difference('IndicatorFederation.count', -1) do
      delete :destroy, id: @indicator_federation
    end

    assert_redirected_to indicator_federations_path
  end
end
