class Public::CustomersController < ApplicationController
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        @customer.update
        redirect_to customer_path(current_customer.id)
    end
    
    def cancel
        @customer = Customer.find(params[:id])
    end
    
    def withdrawal
        @customer = Customer.find(params[:id])
        @customer.update(is_deleted: true)
        reset_session
        redirect_to root_path
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :postal_code, :address, :telephone_number, :is_deleted)
    end
end
