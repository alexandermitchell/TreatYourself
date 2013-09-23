class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.owner_id == current_user.id
			render :edit
		end
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		@restaurant.owner_id = current_user.id
		if @restaurant.save
			redirect_to restaurant_path(@restaurant), notice: "#{@restaurant.name} has been created"
		else
			render :new
		end
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.owner_id == current_user.id
			@restaurant.update_attributes(restaurant_params)
			redirect_to restaurant_path(@restaurant), notice: "Page has been updated"
		else
			render :edit
		end
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.destroy#@restaurant.owner_id == current_user.id
			redirect_to owner_path(current_user), notice: "Restaurant has been deleted"
		else
			redirect_to restaurant_path(@restaurant)
		end
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :address, :image, :phone_number, :website_url, :owner_id, :capacity)
	end

	def reservation_params
			params.require(:reservation).permit(:time_slot, :groupsize, :restaurant_id, :customer_id)
	end


end
