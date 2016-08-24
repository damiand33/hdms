class TestImagesController < ApplicationController
  before_action :set_test_image, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @test_images = TestImage.all
    respond_with(@test_images)
  end

  def show
    respond_with(@test_image)
  end

  def new
    @test_image = TestImage.new
    respond_with(@test_image)
  end

  def edit
  end

  def create
    @test_image = TestImage.new(test_image_params)
    @test_image.save
    respond_with(@test_image)
  end

  def update
    @test_image.update(test_image_params)
    respond_with(@test_image)
  end

  def destroy
    @test_image.destroy
    respond_with(@test_image)
  end

  private
    def set_test_image
      @test_image = TestImage.find(params[:id])
    end

    def test_image_params
      params.require(:test_image).permit(:name, :description, :image)
    end
end
