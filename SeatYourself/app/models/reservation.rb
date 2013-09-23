class Reservation < ActiveRecord::Base

	belongs_to :customer
	belongs_to :restaurant

	validate :less_than_max_occupancy


	def less_than_max_occupancy
	  other_people = Reservation.where(:restaurant_id => self.restaurant_id, :time_slot => self.time_slot.day, :time_slot => self.time_slot.hour).sum(:groupsize)

	  if other_people + self.groupsize > 10
	     errors.add(:base, "Cannot accommodate group size for specified time")
	  end
	end

end
