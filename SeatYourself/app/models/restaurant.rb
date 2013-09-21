class Restaurant < ActiveRecord::Base

	validates :name, :address, :phone_number, presence: true

	belongs_to :owner

	has_many :customers, through: :reservations

	has_many :reservations

	mount_uploader :image, ImageUploader
end
