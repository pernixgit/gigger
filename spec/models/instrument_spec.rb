require 'rails_helper'

describe Instrument do
  describe 'associations' do
    it { should have_and_belong_to_many(:musicians) }
    it { should belong_to(:instrument_type) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
