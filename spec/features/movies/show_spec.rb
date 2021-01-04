require 'rails_helper'

describe 'Movie Show Page' do
  before :each do 
    @s1 = Studio.create!(name: 'Studio 1', location: 'Downtown Denver')
    @m1 = @s1.movies.create!(title: 'LOTR: The Fellowship', creation_year: 2001, genre: 'Fantasy')
    @a1 = Actor.create!(name: 'Actor 1', age: 16)
    @a2 = Actor.create!(name: 'Actor 2', age: 48)
    @a3 = Actor.create!(name: 'Actor 3', age: 25)
    MovieActor.create!(movie: @m1, actor: @a1)
    MovieActor.create!(movie: @m1, actor: @a2)
    MovieActor.create!(movie: @m1, actor: @a3)
    visit movie_path(@m1)
  end

  it 'should display movie title, creation year and genre' do
    expect(page).to have_content(@m1.title)
    expect(@m1.title).to eq('LOTR: The Fellowship')

    expect(page).to have_content('Year Created: ')
    expect(page).to have_content(@m1.creation_year)
    expect(@m1.creation_year).to eq(2001)

    expect(page).to have_content('Genre: ')
    expect(page).to have_content(@m1.genre)
    expect(@m1.genre).to eq('Fantasy')
  end

  it 'should display all the affiliated actors from youngest to oldest' do
    expect(page).to have_content('Actor: ')
    expect(page).to have_content('Age: ')

    expect(page).to have_content(@a1.name)
    expect(@a1.name).to eq('Actor 1')
    expect(page).to have_content(@a1.age)
    expect(@a1.age).to eq(16)

    expect(page).to have_content(@a2.name)
    expect(@a2.name).to eq('Actor 2')
    expect(page).to have_content(@a2.age)
    expect(@a2.age).to eq(48)

    expect(page).to have_content(@a3.name)
    expect(@a3.name).to eq('Actor 3')
    expect(page).to have_content(@a3.age)
    expect(@a3.age).to eq(25)
    
    expect("#{@a3.age}").to appear_before("#{@a2.age}")
  end

  it 'should display the average age of all affiliated actors' do
    expect(page).to have_content('Average Actor Age: ')
    expect(page).to have_content(@m1.avg_act)
    expect(@m1.avg_act).to eq(0.297e2)
  end

  it 'should display a form to add a new actor' do
    expect(page).to have_content('Create New Actor')
    fill_in :name, with: 'Actor 4'
    fill_in :age, with: '65'
    click_button 'Create Actor'

    expect(current_path).to eq(movie_path(@m1))
    expect(page).to have_content('Actor 4')
    expect(page).to have_content(65)
  end
end