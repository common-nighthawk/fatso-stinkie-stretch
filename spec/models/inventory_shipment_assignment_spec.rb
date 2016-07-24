require 'rails_helper'

RSpec.describe InventoryShipmentAssignment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:inventory) }
    it { is_expected.to belong_to(:shipment) }
    it { is_expected.to belong_to(:shipper) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:inventory) }
    it { is_expected.to validate_presence_of(:shipper) }
    it { is_expected.to validate_uniqueness_of(:inventory_id).scoped_to(:shipment_id) }
  end
end
