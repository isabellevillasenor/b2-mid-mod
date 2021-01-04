require 'rails_helper'

describe 'Studio Index Page' do
  before :each do 
    @s1 = Studio.create!(name: 'Studio 1', location: 'Downtown Denver')
    @s2 = Studio.create!(name: 'Studio 2', location: 'Cap Hill')
    @m1 = @s1.movies.create!(title: 'LOTR: The Fellowship', creation_year: 2001, genre: 'Fantasy')
    @m2 = @s2.movies.create!(title: 'Star Wars Empire Strikes Back', creation_year: 1980, genre: 'Sci-Fi')
    visit studios_path
  end

  it 'should have a title' do
    expect(page).to have_content('Studios')
  end

  it 'should display all studio names' do
    expect(page).to have_content(@s1.name)
    expect(@s1.name).to eq('Studio 1')

    expect(page).to have_content(@s2.name)
    expect(@s2.name).to eq('Studio 2')
  end

  it 'should display all names of each associated movie under a studio name' do
    expect(page).to have_content(@m1.title)
    expect(@m1.title).to eq('LOTR: The Fellowship')

    expect(page).to have_content(@m2.title)
    expect(@m2.title).to eq('Star Wars Empire Strikes Back')
  end
end