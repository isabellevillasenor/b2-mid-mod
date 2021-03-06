require 'rails_helper'

describe Movie do
  describe 'relationships' do 
    it { should have_many :movie_actors}
    it { should have_many(:actors).through(:movie_actors) }
    it { should belong_to :studio }
  end
end