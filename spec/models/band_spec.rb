require 'rails_helper'

describe Band do
  describe 'associations' do
    it { should have_many(:musicians) }
    it { should have_and_belong_to_many(:event_types) }
    it { should have_and_belong_to_many(:genres) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
  end
end
