require 'rails_helper'

describe Band do
  describe 'associations' do
    it { should have_many(:musicians) }
  end
end
