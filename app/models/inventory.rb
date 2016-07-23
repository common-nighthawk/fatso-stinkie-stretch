class Inventory < ActiveRecord::Base
  belongs_to :product
  belongs_to :warehouse
  has_one :inventory_shipment_assignment
  has_one :shipment, through: :inventory_shipment_assignment

  scope :shipped, -> { includes(:shipment).where.not(shipments: { actual_departure_date: nil } ) }
  scope :not_shipped, -> { includes(:shipment).where(shipments: { actual_departure_date: nil } ) }
end
