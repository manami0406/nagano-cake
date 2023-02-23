class Public::CartItemsController < ApplicationController
    
    def create
        @cart_item = CartItem.new(cart_item_params)
        if @cart_item.find_by(name: item.name).present?
          cart_item.amount += params[:cart_item][:amount].to_i
          cart_item.save
          redirect_to cart_items_path
        else
          @cart_item.save
          redirect_to cart_items_path
        end
    end

    def index
        @cart_items = CartItem.all
        @total = 0
    end
    
    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to cart_items_path
    end
    
    def destroy_all
        current_customer.cart_items.destroy_all
        redirect_to items_path
    end
    
    private
    
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount, :customer_id)
    end
    
  
end
