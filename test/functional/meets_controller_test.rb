require 'test_helper'

class MeetsControllerTest < ActionController::TestCase
  setup do
    @meet = meets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meet" do
    assert_difference('Meet.count') do
      post :create, meet: { city_id: @meet.city_id, content: @meet.content, title: @meet.title, user_id: @meet.user_id }
    end

    assert_redirected_to meet_path(assigns(:meet))
  end

  test "should show meet" do
    get :show, id: @meet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meet
    assert_response :success
  end

  test "should update meet" do
    put :update, id: @meet, meet: { city_id: @meet.city_id, content: @meet.content, title: @meet.title, user_id: @meet.user_id }
    assert_redirected_to meet_path(assigns(:meet))
  end

  test "should destroy meet" do
    assert_difference('Meet.count', -1) do
      delete :destroy, id: @meet
    end

    assert_redirected_to meets_path
  end
end
