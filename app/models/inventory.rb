class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :warehouse
  has_one :assignment, class_name: InventoryShipmentAssignment
  has_one :shipment, through: :assignment

  scope :shipped, -> { includes(:shipment).where.not(shipments: { actual_departure_date: nil } ) }
  scope :not_shipped, -> { includes(:shipment).where(shipments: { actual_departure_date: nil } ) }

  def guarenteed_assignment
    assignment || build_assignment
  end

  def guarenteed_shipment
    shipment || NullShipment.new
  end
end
