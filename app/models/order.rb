class Order < ApplicationRecord
    
    enum payment_method: { credit_card: 0, transfer: 1 }
    
    enum is_order: { waiting_for_payment: 0, payment_confirmation: 1, making: 2, shipping_preparation: 3, shipping_completed: 4 }
    
    belongs_to :customer
    has_many :order_details, dependent: :destroy
end
