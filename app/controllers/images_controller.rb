class ImagesController < ApplicationController
    def create
    @worksheet = Worksheet.find(params[:worksheet_id])
    @worksheet.attachments.create(attachment_params)
    redirect_to worksheet_path(@worksheet)
  end

  def index
    @attachments = Attachment.all
    @attachment = Attachment.new
  end

  private

  def attachment_params
    params.require(:attachment).permit(:caption, :image)
  end
end
