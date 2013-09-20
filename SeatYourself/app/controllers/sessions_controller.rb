class SessionsController < ApplicationController
  def new
  end

  def create

  	@owner = Owner.where(email: params[:email]).first
  	if @owner
  		if @owner.authenticate(params[:password])
  			session[:owner_id] = @owner.id
  			redirect_to root_path, notice: "Welcome, #{@owner.name}"
  		else
			flash.now[:alert] = "Invalid email or password"
  			render :new
  		end
  	else 
  		@customer = Customer.where(email: params[:email]).first
  		if @customer
  			if @customer.authenticate(params[:password])
  				session[:customer_id] = @customer.id
  				redirect_to root_path, notice: "Welcome, #{@customer.name}"
  			else 
  				flash.now[:alert] = "Invalid email or password"
  				render :new
  			end
  		end
  	end
  end

  def destroy
  	session[:owner_id] = nil
  	redirect_to root_path, notice: "Logged out"
  end

end
