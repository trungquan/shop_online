class UsersController < ApplicationController
 	before_filter :signed_in_user, 
                only: [:show, :index, :edit, :update, :destroy]
  	before_filter :correct_user_or_admin, only: [:edit, :update]
  	before_filter :admin_user, only: [:destroy, :index]
  	before_filter :not_signed_in, only: [:new, :create]

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			sign_in @user
			flash[:success] = "Ban da tao tai khoan thanh cong"
			redirect_to @user
		else 
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			flash[:success] = "Ban da cap nhat thong tin tai khoan thanh cong"
			if current_user?(@user)
				sign_in @user
        	end
        	redirect_to @user
		else
			render 'edit'
		end
	end

	def index
		@users = User.all
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "Xoa tai khoan thanh cong"
		redirect_to users_path
	end

	private
	def correct_user_or_admin
		@user = User.find(params[:id])
      	redirect_to(root_path) if (!current_user?(@user) && !current_user.admin?)
	end

end
