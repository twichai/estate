require "test_helper"

class UnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unit = units(:one)
  end

  test "should get index" do
    get units_url, as: :json
    assert_response :success
  end

  test "should create unit" do
    assert_difference("Unit.count") do
      post units_url, params: { unit: { facing: @unit.facing, floor: @unit.floor, price: @unit.price, project_id: @unit.project_id, room_number: @unit.room_number, sqm: @unit.sqm, status: @unit.status, unit_type: @unit.unit_type, user_id: @unit.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show unit" do
    get unit_url(@unit), as: :json
    assert_response :success
  end

  test "should update unit" do
    patch unit_url(@unit), params: { unit: { facing: @unit.facing, floor: @unit.floor, price: @unit.price, project_id: @unit.project_id, room_number: @unit.room_number, sqm: @unit.sqm, status: @unit.status, unit_type: @unit.unit_type, user_id: @unit.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy unit" do
    assert_difference("Unit.count", -1) do
      delete unit_url(@unit), as: :json
    end

    assert_response :no_content
  end
end
