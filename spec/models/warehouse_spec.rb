require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:shipments) }
  end
end
