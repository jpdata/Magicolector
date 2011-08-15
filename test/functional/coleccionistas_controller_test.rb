require 'test_helper'

class ColeccionistasControllerTest < ActionController::TestCase
  setup do
    @coleccionista = coleccionistas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coleccionistas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coleccionista" do
    assert_difference('Coleccionista.count') do
      post :create, :coleccionista => @coleccionista.attributes
    end

    assert_redirected_to coleccionista_path(assigns(:coleccionista))
  end

  test "should show coleccionista" do
    get :show, :id => @coleccionista.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @coleccionista.to_param
    assert_response :success
  end

  test "should update coleccionista" do
    put :update, :id => @coleccionista.to_param, :coleccionista => @coleccionista.attributes
    assert_redirected_to coleccionista_path(assigns(:coleccionista))
  end

  test "should destroy coleccionista" do
    assert_difference('Coleccionista.count', -1) do
      delete :destroy, :id => @coleccionista.to_param
    end

    assert_redirected_to coleccionistas_path
  end
end
