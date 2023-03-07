class OrderDetail < ApplicationRecord
    
    enum is_making: { cannot_start: 0, waiting_for_making: 1, making:2, completion:3 }
    
    belongs_to :order
    belongs_to :item
end
