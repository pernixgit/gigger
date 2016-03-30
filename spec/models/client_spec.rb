require 'rails_helper'

describe Client do
  describe 'associations' do
    it { should have_many(:events) }
  end
end
