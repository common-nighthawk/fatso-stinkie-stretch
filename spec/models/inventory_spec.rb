require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:warehouse) }
    it { is_expected.to have_one(:assignment) }
    it { is_expected.to have_one(:shipment) }
    it { is_expected.to have_one(:shipper) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:product) }
    it { is_expected.to validate_presence_of(:warehouse) }
  end

  describe 'scopes' do
    let(:warehouse) { Warehouse.create!(name: 'chicago') }
    let(:product) { Product.create!(name: 'blanket') }
    let(:shipper) { FulfillmentSpecialist.create!(email: 'mike@example.com', name: 'mike', location: warehouse) }
    let(:shipment_shipped) { Shipment.create!(actual_departure_date: Date.today - 1, warehouse: warehouse, expected_departure_date: Date.today) }
    let(:shipment_to_be_shipped) { Shipment.create!(actual_departure_date: nil, warehouse: warehouse, expected_departure_date: Date.today + 1) }

    before do
      @item_shipped = Inventory.create!(product: product, warehouse: warehouse)
      @item_to_be_shipped = Inventory.create!(product: product, warehouse: warehouse)
      @item_without_shippment = Inventory.create!(product: product, warehouse: warehouse)
      InventoryShipmentAssignment.create!(inventory: @item_shipped, shipment: shipment_shipped, shipper: shipper)
      InventoryShipmentAssignment.create!(inventory: @item_to_be_shipped, shipment: shipment_to_be_shipped, shipper: shipper)
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
