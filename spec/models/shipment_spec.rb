require 'rails_helper'

RSpec.describe Shipment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:warehouse) }
  end

  describe 'public instance methods' do
    context '#description' do
      let(:warehouse) { Warehouse.create(name: 'chicago') }

      it 'returns the expected_departure_date from the warehouse name' do
        shipment = Shipment.create!(expected_departure_date: '2016-01-01', warehouse: warehouse)
        expect(shipment.description).to eq('2016-01-01 from chicago')
      end
    end

    context '#shipped?' do
      it 'returns true when actual_departure_date is present' do
        shipment = Shipment.create!(actual_departure_date: Date.today)
        expect(shipment.shipped?).to be true
      end

      it 'returns false when actual_departure_date is empty' do
        shipment = Shipment.create!(actual_departure_date: nil)
        expect(shipment.shipped?).to be false
      end
    end
  end
end
