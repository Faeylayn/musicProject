class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :album_name, null: false
      t.integer :band_id, null: false
      t.string :recording

      t.timestamps
    end
  end
end
