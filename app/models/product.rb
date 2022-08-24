class Product < ApplicationRecord
    validates :name, presence: true
    validates :stock, presence: true
    validates :price, presence: true

    belongs_to :user
end
