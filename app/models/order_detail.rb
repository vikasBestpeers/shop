class OrderDetail < ApplicationRecord
    belongs_to :order
    validates :stock, presence: true
    validates :subtotal, presence: true

end
