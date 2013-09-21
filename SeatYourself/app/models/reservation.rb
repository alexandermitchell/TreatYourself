class Reservation < ActiveRecord::Base

	belongs_to :customers
	belongs_to :restaurants

end
