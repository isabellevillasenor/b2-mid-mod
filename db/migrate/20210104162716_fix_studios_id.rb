class FixStudiosId < ActiveRecord::Migration[5.2]
  def change
    rename_column :movies, :studios_id, :studio_id
  end
end
