class Shipment < ActiveRecord::Base
  belongs_to :warehouse

  def shipped?
    !!actual_departure_date
  end
end
