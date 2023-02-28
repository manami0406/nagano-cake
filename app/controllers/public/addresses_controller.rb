class Public::AddressesController < ApplicationController
    
    def index
        @addresses = current_customer.addresses
    end
    
    def create
        @address = Address.new(params[:id])
        @address.save
        redirect_to address_path
    end
    
    private
    
    def address_params
        params.require(:address).permit(:id, :customer_id, :name, :address, :postal_code)
    end
end
