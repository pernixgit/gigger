require 'rails_helper'

describe Client do
  describe 'associations' do
    it { should have_many(:events) }
    it { should have_one(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:identification) }
  end
end
