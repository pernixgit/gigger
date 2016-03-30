require 'rails_helper'

describe Event do
  describe 'associations' do
    it { should belong_to(:client) }
  end
end
