class Owner < ActiveRecord::Base

	has_secure_password

	validates_uniqueness_of :email

	has_many :restaurants

	mount_uploader :image, ImageUploader
end
