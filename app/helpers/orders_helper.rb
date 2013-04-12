module OrdersHelper
	def current_order
		@current_order = Order.find(session[:order_id])
	end
end
