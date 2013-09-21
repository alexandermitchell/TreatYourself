class CustomersController < ApplicationController

  def new
  	@customer = Customer.new
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
  		session[:customer_id] = @customer.id
  		redirect_to root_path, alert: "Account created"
  	else
  		render :new
  	end
  end

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update_attributes(customer_params)
  		redirect_to customer_path(@customer)
  	else
  		render :edit
  	end
  end

  def destroy
  	@customer = Customer.find(params[:id])
  	if @customer.destroy
      reset_session
  		redirect_to root_path
  	else
  		render :edit
  	end
  end

  private

  	def customer_params
  		params.require(:customer).permit(:email, :name, :password, :password_confirmation)
  	end

end
