class Attachment < ActiveRecord::Base
  belongs_to :worksheet
  mount_uploader :image, ImageUploader
end
