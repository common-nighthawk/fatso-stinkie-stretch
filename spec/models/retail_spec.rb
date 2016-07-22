require 'rails_helper'

RSpec.describe Retail, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:users) }
  end
end
