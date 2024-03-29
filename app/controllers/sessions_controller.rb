class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)

		if user && user.password_digest == params[:session][:password]
			session[:user_id] = user.id
			flash[:notice] = "Logged in Successfully"
			redirect_to user
		else
			flash.now[:alert] = "Something went wrong with your details"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out Successfully"
		redirect_to root_path
	end

end