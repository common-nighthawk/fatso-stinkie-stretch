require 'rails_helper'

RSpec.describe RetailStore, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:users) }
  end
end
