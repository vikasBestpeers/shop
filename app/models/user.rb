class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true
  validates :surname, presence: true
  validates :role, presence: true
  has_many :carts
  has_many :products
  has_many :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
