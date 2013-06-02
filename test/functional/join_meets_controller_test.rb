require 'test_helper'

class JoinMeetsControllerTest < ActionController::TestCase
  setup do
    @join_meet = join_meets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:join_meets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create join_meet" do
    assert_difference('JoinMeet.count') do
      post :create, join_meet: { meet_id: @join_meet.meet_id, user_id: @join_meet.user_id }
    end

    assert_redirected_to join_meet_path(assigns(:join_meet))
  end

  test "should show join_meet" do
    get :show, id: @join_meet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @join_meet
    assert_response :success
  end

  test "should update join_meet" do
    put :update, id: @join_meet, join_meet: { meet_id: @join_meet.meet_id, user_id: @join_meet.user_id }
    assert_redirected_to join_meet_path(assigns(:join_meet))
  end

  test "should destroy join_meet" do
    assert_difference('JoinMeet.count', -1) do
      delete :destroy, id: @join_meet
    end

    assert_redirected_to join_meets_path
  end
end
