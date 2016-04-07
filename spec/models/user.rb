require 'rails_helper'

describe User do
  describe 'associations' do
    it { should belong_to(:musician) }
    it { should belong_to(:band) }
    it { should belong_to(:client) }
  end
end
