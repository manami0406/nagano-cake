class Public::CustomersController < ApplicationController
     before_action :authenticate_customer!
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            flash[:notice] = "更新しました"
            redirect_to customer_path(current_customer.id)
        else
            flash[:notice] = "更新に失敗しました"
            redirect_to edit_customer_path
        end
    end
    
    def cancel
        @customer = Customer.find(params[:id])
    end
    
    def withdrawal
        @customer = Customer.find(params[:id])
        if @customer.update(is_deleted: true)
           reset_session
           flash[:notice] = "退会しました"
           redirect_to root_path
        else
           flash[:notice] = "退会に失敗しました"
           redirect_to customer_path(current_customer.id)
        end
    end
    
    private
    
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :password, :postal_code, :address, :telephone_number, :is_deleted)
    end
end
