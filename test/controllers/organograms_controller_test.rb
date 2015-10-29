require 'test_helper'

class OrganogramsControllerTest < ActionController::TestCase
  setup do
    @organogram = organograms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organograms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organogram" do
    assert_difference('Organogram.count') do
      post :create, organogram: { date_final: @organogram.date_final, date_initial: @organogram.date_initial, federation_id: @organogram.federation_id, junior_company_id: @organogram.junior_company_id }
    end

    assert_redirected_to organogram_path(assigns(:organogram))
  end

  test "should show organogram" do
    get :show, id: @organogram
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organogram
    assert_response :success
  end

  test "should update organogram" do
    patch :update, id: @organogram, organogram: { date_final: @organogram.date_final, date_initial: @organogram.date_initial, federation_id: @organogram.federation_id, junior_company_id: @organogram.junior_company_id }
    assert_redirected_to organogram_path(assigns(:organogram))
  end

  test "should destroy organogram" do
    assert_difference('Organogram.count', -1) do
      delete :destroy, id: @organogram
    end

    assert_redirected_to organograms_path
  end
end
