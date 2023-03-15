class Address < ApplicationRecord
    belongs_to :customer
    
    def address_display
      '〒' + postal_code + ' ' + address + ' ' + name
    end
    
    validates :address, presence: true
    validates :name, presence: true
    validates :postal_code, presence: true
    
end
