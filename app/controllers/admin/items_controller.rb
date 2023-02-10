class Admin::ItemsController < ApplicationController
    
    def new
        @item = Item.new
    end
    
    def create
        @item = Item.new(admin_item_params)
        @item.save
        redirect_to admin_items_path
    end
    
    def index
        @items = Item.all
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    
    
    
    private
    
    def admin_item_params
        params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
    end
end
