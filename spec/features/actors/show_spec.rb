require 'rails_helper'

describe 'Actors Show Page' do
  before :each do
    @s1 = Studio.create!(name: 'Studio 1', location: 'Downtown Denver')
    @m1 = @s1.movies.create!(title: 'LOTR: The Fellowship', creation_year: 2001, genre: 'Fantasy')
    @a1 = Actor.create!(name: 'Actor 1', age: 16)
    @a2 = Actor.create!(name: 'Actor 2', age: 48)
    @a3 = Actor.create!(name: 'Actor 3', age: 25)
    MovieActor.create!(movie: @m1, actor: @a1)
    MovieActor.create!(movie: @m1, actor: @a2)
    MovieActor.create!(movie: @m1, actor: @a3)
    visit actor_path(@a2)
  end

  it 'should show their name and age' do
    expect(page).to have_content(@a2.name)
    expect(@a2.name).to eq('Actor 2')

    expect(page).to have_content(@a2.age)
    expect(@a2.age).to eq(48)
  end

  # it 'should show a unique list of all actors this actor worked with' do
  #   expect(page).to have_content(@a1.name)
  #   expect(@a1.name).to eq('Actor 1')

  #   expect(page).to have_content(@a3.name)
  #   expect(@a3.name).to eq('Actor 3')
  # end
end