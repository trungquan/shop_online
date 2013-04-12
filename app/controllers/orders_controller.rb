class OrdersController < ApplicationController
	before_filter :signed_in_user, only: [:show, :create, :edit, :update, :index]
	before_filter :admin_user, only: [:edit, :update]

	def show
		@order = Order.find(params[:id])
	end

	def create
		@order = current_user.orders.build(orderdate: Date.today.to_s)
		if @order.save
			session[:order_id] = @order.id
			flash[:success] = "Ban da dat hang thanh cong"
			redirect_to create_items_path
			# redirect_to orders_path
		else
			flash[:error] = "Da co loi xay ra. Moi ban thao tac lai"
			redirect_to my_cart_path
		end	
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		if @order.update_attributes(params[:order])
			flash[:success] = "Ban da cap nhat thanh cong"
        	redirect_to @order
		else
			render 'edit'
		end
	end

	def index
		if current_user.admin?
			@orders = Order.all
		else
			@orders = current_user.orders.all
		end
	end
end
