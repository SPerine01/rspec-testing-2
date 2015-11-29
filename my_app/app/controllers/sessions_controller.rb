class SessionsController < ApplicationController
	def new
  	end

	def create
		@customer = Customer.find_by_email(params[:email])
		if customer && customer.authenticate(params[:password])
			session[:customer_id] = @customer.id
			flash[:notice] = "You've successfully logged in."

		else
			flash[:alert] = "Incorrect name or password. Please try again"
		end
		redirect_to root_path
	end

	def destroy
	    session[:customer_id] = nil
	    flash[:notice] = "You've successfully signed out."
	    redirect_to root_path
	end

end