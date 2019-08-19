### Api version 1: photo controller
module Api
	module V1
		module Customers
			class OrdersController < ApplicationController
				def index
					@orders = Order.where(customer_id: params[:customer_id])

					render json: @orders
        end
        
        # def create
        #   @order = Order.new(params[:order_id])
        #   @order.save!
        #   render json: @order
        # end
			end
		end
	end
end
