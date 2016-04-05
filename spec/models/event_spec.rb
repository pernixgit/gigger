require 'rails_helper'

describe Event do
  describe 'associations' do
    it { should belong_to(:client) }
    it { should belong_to(:event_type) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
  end
end
