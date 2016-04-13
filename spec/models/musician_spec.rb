require 'rails_helper'

describe Musician do
  describe 'associations' do
    it { should belong_to(:band) }
    it { should have_and_belong_to_many(:instruments) }
    it { should have_and_belong_to_many(:event_types) }
    it { should have_and_belong_to_many(:genres) }
    it { should have_one(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:identification) }
  end
end
