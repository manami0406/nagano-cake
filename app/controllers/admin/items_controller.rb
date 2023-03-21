class Admin::ItemsController < ApplicationController
    
    def new
        @item = Item.new
    end
    
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to admin_item_path(@item)
      else
        render :new
      end
    end
    
    def index
        @items = Item.all
    end
    
    def show
        @item = Item.find(params[:id])
    end
    
    def edit
        @item = Item.find(params[:id])
    end
    
    def update
        @item =Item.find(params[:id])
        if  @item.update(item_params)
            flash[:notice] = "更新しました"
            redirect_to admin_item_path
        else
            flash[:notice] = "更新に失敗しました"
            redirect_to admin_item_path
        end
    end
    
    
    private
    
    def item_params
        params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
    end
end
