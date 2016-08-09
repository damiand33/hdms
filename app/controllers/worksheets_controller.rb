class WorksheetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @worksheets = Worksheet.all
  end

  def new
    @worksheet = Worksheet.new
  end

  def create
    current_user.worksheets.create(worksheet_params)
    redirect_to root_path
  end

  def show
    @worksheet = Worksheet.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @worksheet = Worksheet.find(params[:id])
  end

  def update
    @worksheet = Worksheet.find(params[:id])
    @worksheet.update_attributes(worksheet_params)
    redirect_to root_path
  end

  private

  def worksheet_params
    params.require(:worksheet).permit(:piw_id, :submitted_by, :description)
  end
end
