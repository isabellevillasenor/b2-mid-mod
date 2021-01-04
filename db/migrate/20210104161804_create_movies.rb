class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :creation_year
      t.string :genre
      t.references :studios, foreign_key: true
    end
  end
end
