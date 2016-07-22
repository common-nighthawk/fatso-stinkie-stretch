require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:product) }
    it { is_expected.to belong_to(:warehouse) }
    it { is_expected.to have_one(:inventory_shipment_assignment) }
  end
end
