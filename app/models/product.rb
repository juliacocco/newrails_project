class Product < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :offers, dependent: :destroy
  validates :bar_code, presence: true, uniqueness: true
  validates :model, presence: true
  validates :brand, presence: true
  validates :category, presence: true
  validates :product_type, presence: true
  validates :specs, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
