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
        if @order.update(order_params)
           flash[:notice] = "更新しました"
           redirect_to admin_order_path
        else
           flash[:notice] = "更新に失敗しました"
           redirect_to admin_order_path
        end
    end
    
    private
    
    def order_params
        params.require(:order).permit(:is_order)
    end
end
