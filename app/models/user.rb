class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ratings
  has_many :orders
  validates :email, uniqueness: true
  validates :seller, default: false
  belongs_to :shop, optional: true
end
