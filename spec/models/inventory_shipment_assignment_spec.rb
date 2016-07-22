require 'rails_helper'

RSpec.describe InventoryShipmentAssignment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:inventory) }
    it { is_expected.to belong_to(:shipment) }
    it { is_expected.to belong_to(:user) }
  end
end
