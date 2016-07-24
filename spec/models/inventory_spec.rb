require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:warehouse) }
    it { is_expected.to have_one(:assignment) }
    it { is_expected.to have_one(:shipment) }
    it { is_expected.to have_one(:shipper) }
  end

  describe 'scopes' do
    let(:shipment_shipped) { Shipment.create(actual_departure_date: Date.today - 1) }
    let(:shipment_to_be_shipped) { Shipment.create(actual_departure_date: nil) }

    before do
      @item_shipped = Inventory.create!
      @item_to_be_shipped = Inventory.create!
      @item_without_shippment = Inventory.create!
      InventoryShipmentAssignment.create!(inventory: @item_shipped, shipment: shipment_shipped)
      InventoryShipmentAssignment.create!(inventory: @item_to_be_shipped, shipment: shipment_to_be_shipped)
    end

    context '#shipped' do
      it 'returns all inventory in a shipment that shipped' do
        expect(Inventory.shipped).to contain_exactly(@item_shipped)
      end
    end

    context '#not_shipped' do
      it 'returns all inventory in a shipment not shipped' do
        expect(Inventory.not_shipped).to include(@item_to_be_shipped)
      end

      it 'returns all inventory not in a shipment' do
        expect(Inventory.not_shipped).to include(@item_without_shippment)
      end
    end
  end
end
