require 'rails_helper'

RSpec.describe InventoryShipmentAssignment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:inventory) }
    it { is_expected.to belong_to(:shipment) }
    it { is_expected.to belong_to(:shipper) }
  end

  describe 'validations' do
    let(:product) { Product.create!(name: 'product') }
    let(:pittsburgh) { Warehouse.create!(name: 'pittsburgh') }
    let(:minnesota) { Warehouse.create!(name: 'minnesota') }
    let(:user) { FulfillmentSpecialist.create!(name: 'elizabeth', email: 'elizabeth@example.com', location: pittsburgh) }

    it { is_expected.to validate_presence_of(:inventory) }
    it { is_expected.to validate_presence_of(:shipper) }
    it { is_expected.to validate_uniqueness_of(:inventory_id).scoped_to(:shipment_id) }

    it 'cannot assign inventory to shipment from different warehouse' do
      shipment_from_pittsburg  = Shipment.create!(warehouse: pittsburgh, expected_departure_date: Date.today)
      inventory_from_minnesota = Inventory.create!(product: product, warehouse: minnesota)

      assignment = InventoryShipmentAssignment.new(inventory: inventory_from_minnesota, shipment: shipment_from_pittsburg, shipper: user)
      expect(assignment).to_not be_valid
    end
  end
end
