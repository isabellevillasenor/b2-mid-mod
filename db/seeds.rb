Studio.destroy_all

s1 = Studio.create!(name: 'Studio 1', location: 'Downtown Denver')
s2 = Studio.create!(name: 'Studio 2', location: 'Cap Hill')

m1 = s1.movies.create!(title: 'LOTR: The Fellowship', creation_year: 2001, genre: 'Fantasy')
m2 = s1.movies.create!(title: 'Harry Potter Prison of Azkaban', creation_year: 2004, genre: 'Fantasy')
m3 = s2.movies.create!(title: 'Star Wars Empire Strikes Back', creation_year: 1980, genre: 'Sci-Fi')
m4 = s2.movies.create!(title: 'Star Wars Return of the Jedi', creation_year: 1983, genre: 'Sci-Fi')
m5 = s2.movies.create!(title: 'Star Wars A New Hope', creation_year: 1977, genre: 'Sci-Fi')