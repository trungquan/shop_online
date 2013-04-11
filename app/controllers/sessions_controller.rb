class SessionsController < ApplicationController
before_filter :not_signed_in, only: :new
before_filter :signed_in_user, only: [:add_to_cart, :my_cart]

  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
  		redirect_back_or user
  	else
  		flash.now[:error] = "Sai tai khoan hoac mat khau"
  		render 'new'
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
    reset_session
  end

  def add_to_cart
      if params[:session][:quantity].to_i > 0 
      if session[:cart]
        session[:cart].merge!( { session[:product_id].to_i => params[:session][:quantity].to_i } ) { |key, v1, v2| v1+v2 }
      else
        session[:cart] = Hash.new
        session[:cart] = { session[:product_id].to_i => params[:session][:quantity].to_i }
      end
        redirect_to :back
        # binding.pry
      else
        redirect_to :back
        flash[:error] = "Moi ban nhap lai"
      end
  end

  def my_cart
    # binding.pry
  end

end
