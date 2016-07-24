require 'rails_helper'

RSpec.describe FulfillmentSpecialist, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:type) }
  end
end
