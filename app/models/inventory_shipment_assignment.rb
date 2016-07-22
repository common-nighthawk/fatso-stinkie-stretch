class InventoryShipmentAssignment < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :shipment
  belongs_to :user
end
