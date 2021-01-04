require 'rails_helper'

describe Movie do
  describe 'relationships' do 
    it { should belong_to :studio }
  end
end