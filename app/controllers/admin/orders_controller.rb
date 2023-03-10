class Admin::OrdersController < ApplicationController
    
    def index
        @orders = Order.all
    end
    
    def show
        @order = Order.find(params[:id])
        @order_details = OrderDetail.all
    end
    
    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        redirect_to admin_order_path
    end
    
    private
    
    def order_params
        params.require(:order).permit(:is_order)
    end
end
