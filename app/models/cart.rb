class Cart < ApplicationRecord
    belongs_to :user
    validates :pro_stock, presence: true
end
