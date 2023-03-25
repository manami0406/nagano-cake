class Public::CartItemsController < ApplicationController
     before_action :authenticate_customer!
    
    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
          cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
          cart_item.amount += params[:cart_item][:amount].to_i
          cart_item.save
          flash[:notice] = "カートに追加しました"
          redirect_to cart_items_path
        elsif  @cart_item.save
               flash[:notice] = "カートに追加しました"
               redirect_to cart_items_path
        else
          flash[:notice] = "追加に失敗しました"
          redirect_to cart_items_path
        end
    end
    
    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        flash[:notice] = '個数を変更しました'
        redirect_to cart_items_path
    end

    def index
        @cart_items = current_customer.cart_items
        @total = 0
    end
    
    def destroy
        @cart_item = CartItem.find(params[:id])
        if  @cart_item.destroy
            flash[:notice] = "削除しました"
            redirect_to cart_items_path
        else
            flash[:notice] = "削除に失敗しました"
            redirect_to cart_items_path
        end
    end
    
    def destroy_all
        if  current_customer.cart_items.destroy_all
            flash[:notice] = "削除しました"
            redirect_to cart_items_path
        else
            flash[:notice] = "削除に失敗しました"
            redirect_to cart_items_path
        end
    end
    
    private
    
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount)
    end
    
  
end
