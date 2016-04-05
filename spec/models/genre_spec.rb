require 'rails_helper'

describe Genre do
  describe 'associations' do
    it { should have_and_belong_to_many(:musicians) }
    it { should have_and_belong_to_many(:bands) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
