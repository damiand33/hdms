require 'test_helper'

class TestImagesControllerTest < ActionController::TestCase
  setup do
    @test_image = test_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_image" do
    assert_difference('TestImage.count') do
      post :create, test_image: { description: @test_image.description, image: @test_image.image, name: @test_image.name }
    end

    assert_redirected_to test_image_path(assigns(:test_image))
  end

  test "should show test_image" do
    get :show, id: @test_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @test_image
    assert_response :success
  end

  test "should update test_image" do
    patch :update, id: @test_image, test_image: { description: @test_image.description, image: @test_image.image, name: @test_image.name }
    assert_redirected_to test_image_path(assigns(:test_image))
  end

  test "should destroy test_image" do
    assert_difference('TestImage.count', -1) do
      delete :destroy, id: @test_image
    end

    assert_redirected_to test_images_path
  end
end
