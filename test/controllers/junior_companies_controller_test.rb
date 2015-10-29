require 'test_helper'

class JuniorCompaniesControllerTest < ActionController::TestCase
  setup do
    @junior_company = junior_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:junior_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create junior_company" do
    assert_difference('JuniorCompany.count') do
      post :create, junior_company: { federation_id: @junior_company.federation_id, name: @junior_company.name }
    end

    assert_redirected_to junior_company_path(assigns(:junior_company))
  end

  test "should show junior_company" do
    get :show, id: @junior_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @junior_company
    assert_response :success
  end

  test "should update junior_company" do
    patch :update, id: @junior_company, junior_company: { federation_id: @junior_company.federation_id, name: @junior_company.name }
    assert_redirected_to junior_company_path(assigns(:junior_company))
  end

  test "should destroy junior_company" do
    assert_difference('JuniorCompany.count', -1) do
      delete :destroy, id: @junior_company
    end

    assert_redirected_to junior_companies_path
  end
end
