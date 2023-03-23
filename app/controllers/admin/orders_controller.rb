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
        @order_details = OrderDetail.all
        if @order.update(order_params)
           @order_details.update_all(is_making: 1) if @order.is_order == "payment_confirmation"
           flash[:notice] = "更新しました"
           redirect_to admin_order_path(@order)
        else
           flash[:notice] = "更新に失敗しました"
           redirect_to admin_order_path(@order)
        end
    end
    
    private
    
    def order_params
        params.require(:order).permit(:is_order)
    end
    
end
