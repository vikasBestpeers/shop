class Order < ApplicationRecord
    validates :total_price, presence: true

    has_many :order_details
    belongs_to :user
end
