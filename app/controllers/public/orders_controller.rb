class Public::OrdersController < ApplicationController
    
    def new
        @order = Order.new
    end
    
    def confirm
        @cart_items = current_customer.cart_items
        @total = 0
        @order = Order.new(order_params)
        if params[:order][:select_address] == "0"
            @order.postal_code = current_customer.postal_code
            @order.address = current_customer.address
            @order.name = current_customer.last_name + current_customer.first_name
        elsif params[:order][:select_address] == "1"
            @address = Address.find(params[:order][:address_id])
            @order.postal_code = @address.postal_code
            @order.address = @address.address
            @order.name = @address.name
        else params[:order][:select_address] == "2"
            
        end
            
    end
    
    def create
        @order = Order.new(order_params)
        @order.save
        @cart_items = current_customer.cart_items
        @cart_items.each do |cart_item|
          @order_detail = OrderDetail.new
          @order_detail.order_id = @order.id
          @order_detail.item_id = cart_item.item_id
          @order_detail.amount = cart_item.amount
          @order_detail.price = cart_item.item.price
          @order_detail.is_making = 0
          @order_detail.save
        end
        redirect_to complete_orders_path
    end
    
    private
    
    def order_params
        params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :customer_id)
    end
    
end
