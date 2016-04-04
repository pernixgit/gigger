require 'rails_helper'

describe EventType do
  describe 'associations' do
    it { should have_many(:events) }
    it { should have_and_belong_to_many(:bands) }
    it { should have_and_belong_to_many(:musicians) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
