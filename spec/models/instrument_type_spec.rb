require 'rails_helper'

describe InstrumentType do
  describe 'associations' do
    it { should have_many(:instruments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
