class Order < ApplicationRecord
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    enum is_order: { waiting_for_payment: 0, payment_confirmation: 1, making: 2, shipping_preparation: 3, shipping_completed: 4 }
    
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    
    def subtotal
      item.with_tax_price * amount
    end
    
    validates :postal_code, presence: true
    validates :address, presence: true
    validates :name, presence: true
    validates :postage, presence: true
    validates :total_payment, presence: true
    validates :payment_method, presence: true
end
