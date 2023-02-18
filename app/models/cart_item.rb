class CartItem < ApplicationRecord
    
    def create
        @cart_item = current_customer.cart_items.build(cart_item_params)
        @cart_item.save
        redirect_to cart_items_path
    end

    def index
    end
    
    private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
