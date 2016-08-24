class TestImage < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
