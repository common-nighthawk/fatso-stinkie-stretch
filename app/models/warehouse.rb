class Warehouse < ActiveRecord::Base
  has_many :shipments
  has_many :users, as: :location

  validates :name, presence: true
  validates :name, uniqueness: true
end
