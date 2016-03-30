require 'rails_helper'

describe Musician do
  describe 'associations' do
    it { should belong_to(:band) }
  end
end
