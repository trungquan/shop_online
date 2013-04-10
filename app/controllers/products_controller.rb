class ProductsController < ApplicationController

	def new
		@product = Product.new
	end

	def show
		@product = Product.find(params[:id])
	end

	def create
		# binding.pry
		category = Category.find(params[:id])
		@product= category.products.build(params[:product])
  		if @product.save
  			flash[:success] = "Tao product thanh cong"
  			redirect_to @product
  		else
  			render 'new'
  		end
	end

	def index
		@products = Product.all
	end
end
