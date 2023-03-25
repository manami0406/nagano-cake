class Admin::OrderDetailsController < ApplicationController
    
    def update
        @order_detail = OrderDetail.find(params[:id])
        @order = @order_detail.order
        @order_details = @order.order_details
        @order_detail.update(order_detail_params)

        if @order_details.where(is_making: "making").count >= 1
          @order.is_order = "making"
          @order.save
          flash[:notice] = "更新しました"
        end

        if @order.order_details.count == @order_details.where(is_making: "completion").count
          @order.is_order = "shipping_preparation"
          @order.save
          flash[:notice] = "更新しました"
        end
      redirect_to admin_order_path(@order_detail.order.id)
    end
          
    
    private
    
    def order_detail_params
        params.require(:order_detail).permit(:is_making)
    end
end
