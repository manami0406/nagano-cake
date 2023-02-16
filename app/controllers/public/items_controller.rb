class Public::ItemsController < ApplicationController
    
    def index
        @items = Item.all
    end
    
    def show
        @item = Item.find(params[:id])
        @cart_items = CartItem.find(cart_item_params[:item_id])
    end
    
    private
    
    def item_params
        params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
    end
    
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount)
    end
end
