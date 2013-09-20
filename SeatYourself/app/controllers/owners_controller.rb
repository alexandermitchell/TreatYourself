class OwnersController < ApplicationController

	before_action :find_owner, only: [:show, :edit, :update, :destroy]

	def new 
		@owner = Owner.new
	end

	def create
		@owner = Owner.new(owner_params)
		if @owner.save
			session[:owner_id] = @owner.id
			redirect_to owner_path(current_user), alert: "Signed up"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @owner.update_attributes(owner_params)
			redirect_to owner_path(current_user)
		else
			render :edit
		end
	end

	def destroy
		if @owner == current_user
			@owner.destroy
			reset_session
			redirect_to root_path, alert: "Account has been deleted"
		else 
			render :edit
		end
	end

	private
	
	def owner_params
		params.require(:owner).permit(:name, :email, :password, :password_confirmation)
	end

	def find_owner
		@owner = Owner.find(params[:id])
	end

end

