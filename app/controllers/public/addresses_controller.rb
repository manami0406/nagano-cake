class Public::AddressesController < ApplicationController
    
    def index
        @addresses = Address.all
    end
    
    def create
        @address = Address.new(address_params)
        @address.save
        redirect_to address_path
    end
    
    private
    def address_params
        params.require(:address).permit(:id, :customer_id, :name, :postal_code, :address)
    end
end
