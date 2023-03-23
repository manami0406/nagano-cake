class Admin::OrderDetailsController < ApplicationController
    
    def update
        @order = Order.find(params[:order_id])
        @order_detail = OrderDetail.find(params[:id])
        @order_details = @order.order_details.all
        
        is_updated = true
          if @order_detail.update(order_detail_params)
            @order.update(status: 2) if @order_detail.is_making == "making"
            @order_details.each do |order_detail| 
              if order_detail.making_status != "production_complete"
                is_updated = false
              end
            end
            @order.update(status: 3) if is_updated
          end
          
        flash[:notice] = "更新しました"
        redirect_to admin_orders_path
    end
    
    private
    
    def order_detail_params
        params.require(:order_detail).permit(:is_making)
    end
end
