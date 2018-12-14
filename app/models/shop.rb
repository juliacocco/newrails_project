class Shop < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :offers, dependent: :destroy
  has_many :users
  validates :company_number, uniqueness: true, presence: true
  validates :commercial_name, presence: true
  validates :legal_name, presence: true
  validates :address, presence: true
  mount_uploader :photo, PhotoUploader
end
