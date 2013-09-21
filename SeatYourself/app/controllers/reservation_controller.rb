class ReservationController < ApplicationController
	

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@restaurant = Restaurant.find(params[:id])
		@reservation = @restaurant.reservation.build(reservation_params)
		if @reservation.save
			redirect_to customer_path(current_user), notice: "Reservation has been made!"
		else 
		render :new
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		if @reservation.destroy
			redirect_to root_path
		else
			redirect_to restaurant_reservation_path(@reservation)
		end
	end

	private 

		# def reservation_params
		# 	params.require(:reservation).permit(:time_slot, :groupsize, :restaurant_id, :customer_id)
		# end

		def reservation_params
			params.require(:reservation).permit(:time_slot, :groupsize, :restaurant_id, :customer_id)
		end

end
