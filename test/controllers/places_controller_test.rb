require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get places_path
    assert_response :success
  end

  test "should get new" do
    get new_place_path
    assert_response :success
  end

  test "should get create" do
    @place = places(:one)
    get place_path(@place)
    assert_response :success
  end

end
