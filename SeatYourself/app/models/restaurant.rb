class Restaurant < ActiveRecord::Base

	validates :name, :address, :phone_number, presence: true

	belongs_to :owner

	mount_uploader :image, ImageUploader
end
