class ProductsController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, 
										:edit, :destroy]
	before_filter :admin_user, only: [:new, :create, :edit, :destroy]
	
	def new
		@categories = Category.all
		@product = Product.new
	end

	def show
		@product = Product.find(params[:id])
	end

	def create
		@categories = Category.all
		@product= Product.new(params[:product])
  		if @product.save
  			flash[:success] = "Tao product thanh cong"
  			redirect_to allproducts_path
  		else
  			render 'new'
  		end
	end

	def index
		@products = Product.all
	end

	def edit
		@categories = Category.all
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(params[:product])
			flash[:success] = "Ban da cap nhat thanh cong"
        	redirect_to @product
		else
			render 'edit'
		end
	end

	def destroy
  		Product.find(params[:id]).destroy
  		flash[:seccess] = "Ban da xoa thanh cong"
  		redirect_to allproducts_path
  	end

  	 def find_category
    	@category = Category.find(params[:id])
    	@products = @category.products

    	render 'index'
  	end
end
