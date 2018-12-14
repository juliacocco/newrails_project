class Offer < ApplicationRecord
  belongs_to :shop
  belongs_to :product
  has_many :orders, dependent: :destroy
  monetize :price_cents
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :price, presence: true
  belongs_to :product
  include PgSearch
  pg_search_scope :global_search,
    associated_against: {
      product: [:product_type, :model, :category, :brand]
    },
    using: {
      tsearch: { prefix: true }
    }
end
