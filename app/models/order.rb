class Order < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  validates :price_snapshot, presence: true
  validates :units, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validate :validate_unit_stock
  # validates :payment_info
  # we need a callback to update the price snap_shot based on the amount/units in this order.
  before_save :update_price


  private

  def validate_unit_stock
    if self.units > self.offer.stock
      errors.add(:units, "can't be higher than the stock")
    end
  end

  def update_price
    self.price_snapshot = self.units * self.offer.price_cents
  end
end
