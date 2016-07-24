class InventoryShipmentAssignment < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :shipment
  belongs_to :shipper, class_name: User, foreign_key: 'user_id'
end
