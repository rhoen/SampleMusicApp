class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.timestamps
    end
    add_index :albums, :album_id
  end
end
