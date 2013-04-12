class ApplicationController < ActionController::Base
	include SessionsHelper
	include OrdersHelper
  	protect_from_forgery
  	def handle_unverified_request
    sign_out
    super
  end
end
