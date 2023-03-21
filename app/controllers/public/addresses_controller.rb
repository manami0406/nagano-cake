class Public::AddressesController < ApplicationController
    
    def index
        @address = Address.new
        @addresses = current_customer.addresses
    end
    
    def create
        @address = Address.new(address_params)
        @address.customer_id = current_customer.id
        if @address.save
            redirect_to addresses_path
        else
            render :index
        end
    end
    
    def edit
        @address = Address.find(params[:id])
    end
    
    def update
        @address = Address.find(params[:id])
        if  @address.update(address_params)
            flash[:notice] = "更新しました"
            redirect_to addresses_path
        else
            flash[:notice] = "更新に失敗しました"
            redirect_to addresses_path
        end
    end
    
    def destroy
        @address = Address.find(params[:id])
        if  @address.destroy
            flash[:notice] = "削除しました"
            redirect_to addresses_path
        else
            flash[:notice] = "削除に失敗しました"
            redirect_to addresses_path
        end
    end
    
    private
    
    def address_params
        params.require(:address).permit(:id, :customer_id, :name, :address, :postal_code)
    end
end
