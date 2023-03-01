class Public::AddressesController < ApplicationController
    
    def index
        @address = Address.new
        @addresses = current_customer.addresses
    end
    
    def create
        @address = Address.new(address_params)
        @address.customer_id = current_customer.id
        @address.save
        redirect_to addresses_path
    end
    
    private
    
    def address_params
        params.require(:address).permit(:id, :customer_id, :name, :address, :postal_code)
    end
end
