class Shipment < ActiveRecord::Base
  belongs_to :warehouse

  scope :departing_from, -> (warehouse) { where(warehouse: warehouse) }
  scope :not_shipped, -> { where(actual_departure_date: nil) }

  def description
    "#{expected_departure_date} from #{warehouse.name}"
  end

  def shipped?
    !!actual_departure_date
  end

  def self.possible_for(inventory)
    not_shipped.departing_from(inventory.warehouse)
  end
end
