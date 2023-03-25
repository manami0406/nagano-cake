class Admin::OrdersController < ApplicationController
    
    def index
        @orders = Order.all
    end
    
    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
    end
    
    def update
        @order = Order.find(params[:id])
        @order.update(order_params)
        @order_details = @order.order_details
        
        if @order.is_order == "payment_confirmation"
            @order_details.each do |order_detail|
              order_detail.is_making = "waiting_for_making"
              order_detail.save
              flash[:notice] = "更新しました"
            end
        end
        redirect_to admin_order_path
    end
    
    private
    
    def order_params
        params.require(:order).permit(:is_order)
    end
end
