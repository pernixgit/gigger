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

  describe 'named scopes' do
    context '.event_type' do

      let(:event_type_1) { create(:event_type, name: 'type 1') }
      let(:event_type_2) { create(:event_type, name: 'type 2') }

      let(:events_1) { create_list(:event, 5, event_type_id: event_type_1.id) }
      let(:events_2) { create_list(:event, 5, event_type_id: event_type_2.id) }

      it 'returns the events with a certain event type' do
        expect(described_class.event_type(event_type_1.id)).to eq(events_1)
      end
    end

    context '.starts_with' do
      let(:events_1) { create_list(:event, 5, name: 'list 1') }
      let(:events_2) { create_list(:event, 5, name: 'list 2') }

      it 'returns the events with where name contains certain string' do
        expect(described_class.starts_with('1')).to eq(events_1)
      end
    end
  end
end
