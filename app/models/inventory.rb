class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :warehouse
  has_one :inventory_shipment_assignment
end
