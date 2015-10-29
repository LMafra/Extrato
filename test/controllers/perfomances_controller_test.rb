require 'test_helper'

class PerfomancesControllerTest < ActionController::TestCase
  setup do
    @perfomance = perfomances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perfomances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perfomance" do
    assert_difference('Perfomance.count') do
      post :create, perfomance: { federations_id: @perfomance.federations_id, junior_companies_id: @perfomance.junior_companies_id, name: @perfomance.name, role_id: @perfomance.role_id }
    end

    assert_redirected_to perfomance_path(assigns(:perfomance))
  end

  test "should show perfomance" do
    get :show, id: @perfomance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @perfomance
    assert_response :success
  end

  test "should update perfomance" do
    patch :update, id: @perfomance, perfomance: { federations_id: @perfomance.federations_id, junior_companies_id: @perfomance.junior_companies_id, name: @perfomance.name, role_id: @perfomance.role_id }
    assert_redirected_to perfomance_path(assigns(:perfomance))
  end

  test "should destroy perfomance" do
    assert_difference('Perfomance.count', -1) do
      delete :destroy, id: @perfomance
    end

    assert_redirected_to perfomances_path
  end
end
