Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
MovieActor.destroy_all

s1 = Studio.create!(name: 'Studio 1', location: 'Downtown Denver')
s2 = Studio.create!(name: 'Studio 2', location: 'Cap Hill')

m1 = s1.movies.create!(title: 'LOTR: The Fellowship', creation_year: 2001, genre: 'Fantasy')
m2 = s1.movies.create!(title: 'Harry Potter Prison of Azkaban', creation_year: 2004, genre: 'Fantasy')
m3 = s2.movies.create!(title: 'Star Wars Empire Strikes Back', creation_year: 1980, genre: 'Sci-Fi')
m4 = s2.movies.create!(title: 'Star Wars Return of the Jedi', creation_year: 1983, genre: 'Sci-Fi')
m5 = s2.movies.create!(title: 'Star Wars A New Hope', creation_year: 1977, genre: 'Sci-Fi')

a1 = Actor.create!(name: 'Actor 1', age: 16)
a2 = Actor.create!(name: 'Actor 2', age: 48)
a3 = Actor.create!(name: 'Actor 3', age: 25)
a4 = Actor.create!(name: 'Actor 4', age: 32)
a5 = Actor.create!(name: 'Actor 5', age: 22)


MovieActor.create!(movie: m1, actor: a1)
MovieActor.create!(movie: m1, actor: a2)
MovieActor.create!(movie: m1, actor: a3)
MovieActor.create!(movie: m2, actor: a4)
MovieActor.create!(movie: m2, actor: a5)
MovieActor.create!(movie: m3, actor: a1)
MovieActor.create!(movie: m4, actor: a2)
MovieActor.create!(movie: m5, actor: a3)