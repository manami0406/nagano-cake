class Admin::OrderDetailsController < ApplicationController
    
    def update
        @order_detail = OrderDetail.find(params[:id])
        if @order_detail.update(order_detail_params)
           flash[:notice] = "更新しました"
           redirect_to admin_order_path
        else
            flash[:notice] = "更新に失敗しました"
            redirect_to admin_order_path
        end
    end
    
    private
    
    def order_detail_params
        params.require(:order_detail).permit(:is_making)
    end
end
