class CategoriesController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, 
										:edit, :destroy]
	before_filter :admin_user, only: [:new, :create, :edit, :destroy]

  def new
  	@category = Category.new
  end

  def show
  	@category = Category.find(params[:id])
    @products = @category.products.all	
  end

  def create
  	@category = Category.new(params[:category])
  	if @category.save
  		flash[:success] = "Tao category thanh cong"
  		redirect_to @category
  	else
  		render 'new'
  	end
  end

  def index
  	@categories = Category.all
  end

  def edit
  	@category = Category.find(params[:id])	
  end

  def update
  	@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			flash[:success] = "Ban da cap nhat thanh cong"
        	redirect_to @category
		else
			render 'edit'
		end
  end

  def destroy
  	Category.find(params[:id]).destroy
  	flash[:seccess] = "Xoa category thanh cong"
  	redirect_to categories_path
  end

end
