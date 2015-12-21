require 'test_helper'

class IndicatorJuniorCompaniesControllerTest < ActionController::TestCase
  setup do
    @indicator_junior_company = indicator_junior_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicator_junior_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicator_junior_company" do
    assert_difference('IndicatorJuniorCompany.count') do
      post :create, indicator_junior_company: { id_indicator: @indicator_junior_company.id_indicator, id_junior_company: @indicator_junior_company.id_junior_company, name: @indicator_junior_company.name, value: @indicator_junior_company.value }
    end

    assert_redirected_to indicator_junior_company_path(assigns(:indicator_junior_company))
  end

  test "should show indicator_junior_company" do
    get :show, id: @indicator_junior_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @indicator_junior_company
    assert_response :success
  end

  test "should update indicator_junior_company" do
    patch :update, id: @indicator_junior_company, indicator_junior_company: { id_indicator: @indicator_junior_company.id_indicator, id_junior_company: @indicator_junior_company.id_junior_company, name: @indicator_junior_company.name, value: @indicator_junior_company.value }
    assert_redirected_to indicator_junior_company_path(assigns(:indicator_junior_company))
  end

  test "should destroy indicator_junior_company" do
    assert_difference('IndicatorJuniorCompany.count', -1) do
      delete :destroy, id: @indicator_junior_company
    end

    assert_redirected_to indicator_junior_companies_path
  end
end
