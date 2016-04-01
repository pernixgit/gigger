require 'rails_helper'

describe Band do
  describe 'associations' do
    it { should have_many(:musicians) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
  end
end
