class ReservationsController < ApplicationController

  before_action :find_reservation, only: [:edit, :show, :update, :destroy]

	def new
    #@customer = Customer.find(params[:customer_id])
     @restaurant = Restaurant.find(params[:restaurant_id])
     @reservation = @restaurant.reservations.build
 	end
  
  	def index
    @reservations = Reservation.where(customer_id: current_user.id)
  	end
  
  	def create
    #@customer = Customer.find(params[:customer_id])
    	@restaurant = Restaurant.find(params[:restaurant_id])
    	@reservation = @restaurant.reservations.build(reservation_params) #&& @customer.reservations.build(params[:reservation])
    	@reservation.customer_id = current_user.id
        if @reservation.save
      		redirect_to root_path
        else
      		render :new
        end
  	end

  	def show
  	end

  	def edit
      @restaurant = Restaurant.find(params[:restaurant_id])
      #@reservation = Reservation.find(params[:id])
      
  	end

  	def update
    	if @reservation.update_attributes(reservation_params)
     		 redirect_to customer_path(current_user)
    	else
      		render :edit
    	end
  	end

  	def destroy
      @restaurant = Restaurant.find(params[:restaurant_id])
   		@reservation.destroy
    	redirect_to root_path, notice: "reservation deleted"
  	end

  private

    def reservation_params
      params.require(:reservation).permit(:time_slot, :restaurant_id, :customer_id, :groupsize)
    end

  	def restaurant_params
		  params.require(:restaurant).permit(:name, :address, :image, :phone_number, :website_url, :owner_id, :capacity)
    end

    def find_reservation
      @reservation = Reservation.find(params[:id])
    end

end
