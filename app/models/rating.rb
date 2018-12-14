class Rating < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5] }
end
