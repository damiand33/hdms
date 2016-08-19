class AttachmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @worksheet = Worksheet.find(params[:worksheet_id])
    @worksheet.attachments.create(attachment_params)
    redirect_to worksheet_path(@worksheet)
  end

  private

  def attachment_params
    params.require(:attachment).permit(:caption, :image)
  end
end
