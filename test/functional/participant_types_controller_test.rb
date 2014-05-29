require 'test_helper'

class ParticipantTypesControllerTest < ActionController::TestCase
  setup do
    @participant_type = participant_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participant_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participant_type" do
    assert_difference('ParticipantType.count') do
      post :create, participant_type: { name: @participant_type.name, type: @participant_type.type }
    end

    assert_redirected_to participant_type_path(assigns(:participant_type))
  end

  test "should show participant_type" do
    get :show, id: @participant_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participant_type
    assert_response :success
  end

  test "should update participant_type" do
    put :update, id: @participant_type, participant_type: { name: @participant_type.name, type: @participant_type.type }
    assert_redirected_to participant_type_path(assigns(:participant_type))
  end

  test "should destroy participant_type" do
    assert_difference('ParticipantType.count', -1) do
      delete :destroy, id: @participant_type
    end

    assert_redirected_to participant_types_path
  end
end
