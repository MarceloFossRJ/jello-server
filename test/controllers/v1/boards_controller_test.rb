require 'test_helper'

class V1::BoardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:active)
    @user = users(:admin)
    @board_attributes = {
      creator_id: @user.id,
      title: 'Another Board',
      archived: false
    }
  end

  test "should get index" do
    get v1_boards_url, as: :json
    assert_response :success
  end

  test "should create board" do
    assert_difference('Board.count') do
      post v1_boards_url, params: { board: @board_attributes }, as: :json
    end

    assert_response 201
  end

  test "should show board" do
    get v1_board_url(@board), as: :json
    assert_response :success
  end

  test "should update board" do
    patch v1_board_url(@board), params: { board: @board_attributes }, as: :json
    assert_response 200
  end

  test "should destroy board" do
    assert_difference('Board.count', -1) do
      delete v1_board_url(@board), as: :json
    end

    assert_response 204
  end
end
