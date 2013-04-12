class ItemsController < ApplicationController
before_filter :signed_in_user, only: :create

	def create
		session[:cart].each do |k,v|
			@item = current_order.items.build(product_id:k, quantity:v)
			if @item.save == false
				flash[:error] = "Da co loi xay ra. Moi ban thao tac lai"
				redirect_to my_cart_path
			end
		end
		redirect_to order_path(current_order)
		flash[:success] = "Ban da dat hang thanh cong"
		reset_session
	end
	
end
