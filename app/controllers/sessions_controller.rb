class SessionsController < ApplicationController
before_filter :not_signed_in, only: :new
before_filter :signed_in_user, only: [:add_to_cart, :my_cart, 
                :remove_from_cart, :emty_cart]

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
    if session[:cart]
      session[:cart].merge!( { session[:product_id].to_i => 1 } ) { |key, v1, v2| v1+v2 }
    else
      session[:cart] = Hash.new
      session[:cart] = { session[:product_id].to_i => 1 }
    end
      redirect_to my_cart_path
  end

  def remove_from_cart
    session[:cart].delete(params[:product_id].to_i)
    if session[:cart].length == 0
      reset_session
    end
    redirect_to my_cart_path
  end

  def emty_cart
    reset_session
    redirect_to my_cart_path
  end

  def my_cart
    # binding.pry
  end

end
