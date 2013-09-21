class Customer < ActiveRecord::Base
	has_secure_password
	
	validates_uniqueness_of :email

	mount_uploader :image, ImageUploader
end
