require 'rails_helper'

describe Musician do
  describe 'associations' do
    it { should belong_to(:band) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:identification) }
  end
end
