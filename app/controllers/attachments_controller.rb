class AttachmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @worksheet = Worksheet.find(params[:worksheet_id])
    @worksheet.attachments.create(attachment_params)
    redirect_to worksheet_path(@worksheet)
  end

  def destroy
    puts "destroy"
    @worksheet = Worksheet.find(params[:worksheet_id])
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    redirect_to worksheet_path(@worksheet)
  end

  def edit
    @worksheet = Worksheet.find(params[:worksheet_id])
    @attachment = Attachment.find(params[:id])
  end

  def update
    @worksheet = Worksheet.find(params[:worksheet_id])
    @attachment = Attachment.find(params[:id])
    @attachment.update_attributes(attachment_params)
    redirect_to worksheet_path(@worksheet)
  end

  private

  def attachment_params
    params.require(:attachment).permit(:caption, :image, :name)
  end
end
