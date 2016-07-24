class NullShipment
  def id
    nil
  end

  def description
    ''
  end

  def expected_departure_date
   Date.new(0)
  end
end
