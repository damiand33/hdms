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
  end

  private

  def worksheet_params
    params.require(:worksheet).permit(:piw_id, :submitted_by, :description)
  end
end
