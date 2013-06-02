require 'test_helper'

class JoinGroupsControllerTest < ActionController::TestCase
  setup do
    @join_group = join_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:join_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create join_group" do
    assert_difference('JoinGroup.count') do
      post :create, join_group: { group_id: @join_group.group_id, user_id: @join_group.user_id }
    end

    assert_redirected_to join_group_path(assigns(:join_group))
  end

  test "should show join_group" do
    get :show, id: @join_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @join_group
    assert_response :success
  end

  test "should update join_group" do
    put :update, id: @join_group, join_group: { group_id: @join_group.group_id, user_id: @join_group.user_id }
    assert_redirected_to join_group_path(assigns(:join_group))
  end

  test "should destroy join_group" do
    assert_difference('JoinGroup.count', -1) do
      delete :destroy, id: @join_group
    end

    assert_redirected_to join_groups_path
  end
end
