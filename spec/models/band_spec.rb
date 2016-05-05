require 'rails_helper'

describe Band do
  describe 'associations' do
    it { should have_many(:musicians) }
    it { should have_and_belong_to_many(:event_types) }
    it { should have_and_belong_to_many(:genres) }
    it { should have_one(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
  end

  describe 'named scopes' do
    context '.event_type' do

      let(:event_type_1) { create(:event_type, name: 'type 1') }
      let(:event_type_2) { create(:event_type, name: 'type 2') }

      let(:bands_1) { create_list(:band, 5, event_types: [event_type_1]) }
      let(:bands_2) { create_list(:band, 5, event_types: [event_type_2]) }

      it 'returns the bands which perform at a certain event type' do
        expect(described_class.event_type(event_type_1.id)).to eq(bands_1)
      end
    end
  end
end
