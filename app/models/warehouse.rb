class Warehouse < ActiveRecord::Base
  has_many :shipments
  has_many :users, as: :location
end
