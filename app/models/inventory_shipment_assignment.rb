class InventoryShipmentAssignment < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :shipment
  belongs_to :shipper, class_name: User, foreign_key: 'user_id'

  validates :inventory, presence: true
  validates :shipper, presence: true
  validates :inventory_id, uniqueness: { scope: :shipment_id }
  validate :inventory_in_shipment_from_same_warehouse

  private

  def inventory_in_shipment_from_same_warehouse
    if shipment && (inventory.warehouse != shipment.warehouse)
      errors.add(:inventory, 'must be assigned to shipment from same warehouse')
    end
  end
end
