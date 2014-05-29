require 'test_helper'

class EventPermissionsControllerTest < ActionController::TestCase
  setup do
    @event_permission = event_permissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_permissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_permission" do
    assert_difference('EventPermission.count') do
      post :create, event_permission: { event_id: @event_permission.event_id, participant_type_id: @event_permission.participant_type_id, user_id: @event_permission.user_id }
    end

    assert_redirected_to event_permission_path(assigns(:event_permission))
  end

  test "should show event_permission" do
    get :show, id: @event_permission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_permission
    assert_response :success
  end

  test "should update event_permission" do
    put :update, id: @event_permission, event_permission: { event_id: @event_permission.event_id, participant_type_id: @event_permission.participant_type_id, user_id: @event_permission.user_id }
    assert_redirected_to event_permission_path(assigns(:event_permission))
  end

  test "should destroy event_permission" do
    assert_difference('EventPermission.count', -1) do
      delete :destroy, id: @event_permission
    end

    assert_redirected_to event_permissions_path
  end
end
