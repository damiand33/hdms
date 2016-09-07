class WorksheetsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :edit, :update]
   
  def index
    @worksheets = Worksheet.order('id desc').all
    @currentUser = current_user.username   

    respond_to do |format| #Helper for exporting to Excel
      format.html
      format.csv { send_data @worksheets.to_csv}
      format.xls #{ send_data @worksheets.to_csv(col_sep: "\t")}
    end
  end

  def new
    @worksheet = Worksheet.new    
    t = Time.now.in_time_zone("Eastern Time (US & Canada)")  
    @auto_id = t.strftime("%m%d%y%H%M") + current_user.username.upcase   
  end

  def create    
    @worksheet = current_user.worksheets.create(worksheet_params)
    if @worksheet.valid?    
      redirect_to @worksheet 
    else
      t = Time.now.in_time_zone("Eastern Time (US & Canada)")  
      @auto_id = t.strftime("%m%d%y%H%M") + current_user.username.upcase 
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @worksheet = Worksheet.find(params[:id])
    @comment = Comment.new
    @attachment = Attachment.new    
    @updateTime = Worksheet.maximum('updated_at')
    @images = Attachment.where worksheet_id: (params[:id])

    @images.each do |image|
      if image.updated_at > @worksheet.updated_at
        @updateTime = image.updated_at
      end
    end  
  end

  def edit
    @worksheet = Worksheet.find(params[:id])
    @attachments = Attachment.all    
  end

  def update
    @worksheet = Worksheet.find(params[:id])
    @worksheet.update_attributes(worksheet_params)
    if @worksheet.valid?      
      redirect_to @worksheet 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def images
    @attachments = Attachment.all
    @attachment = Attachment.new
  end

  def edit_image
  end
  
  private

  def worksheet_params
    params.require(:worksheet).permit(:piw_id, :submitted_by, :pre_load, :module, :date_opened, :incident_report_number, :description_as_is, 
                                      :description_to_be, :impact, :requested_by, :action_taken, :action_taken_by, :date_closed, :status)
  end  
end
