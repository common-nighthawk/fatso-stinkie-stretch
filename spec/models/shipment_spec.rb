require 'rails_helper'

RSpec.describe Shipment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:warehouse) }
  end
end
