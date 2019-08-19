### Api version 1: photo controller
module Api
	module V1
		module Customers
			class OrdersController < ApplicationController
        def index
          if params[:customer_id]
            @orders = Order.where(customer_id: params[:customer_id])
          else
            @orders = Order.all
          end
					render json: @orders
        end
        
        def create
          @order = Order.new(customer_id: params[:customer_id])
          @order[:status] = 'pending'

          render json: @order
        end

        def show
          @order = Order.find(params[:order_id])

          render json: @order
        end

        def ship
          @order = Order.find(params[:order_id])
          @order[:status] = 'shipped'

          render json: @order
        end

        private

        def order_params
          params.require(:customer_id)
        end
			end
		end
	end
end
