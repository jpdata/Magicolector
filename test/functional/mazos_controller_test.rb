require 'test_helper'

class MazosControllerTest < ActionController::TestCase
  setup do
    @mazo = mazos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mazos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mazo" do
    assert_difference('Mazo.count') do
      post :create, :mazo => @mazo.attributes
    end

    assert_redirected_to mazo_path(assigns(:mazo))
  end

  test "should show mazo" do
    get :show, :id => @mazo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mazo.to_param
    assert_response :success
  end

  test "should update mazo" do
    put :update, :id => @mazo.to_param, :mazo => @mazo.attributes
    assert_redirected_to mazo_path(assigns(:mazo))
  end

  test "should destroy mazo" do
    assert_difference('Mazo.count', -1) do
      delete :destroy, :id => @mazo.to_param
    end

    assert_redirected_to mazos_path
  end
end
