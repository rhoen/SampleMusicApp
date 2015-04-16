class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.text :lyrics
      t.string :track_type, default: 'regular'
      t.integer :album_id
      t.timestamps
    end
    add_index :tracks, :album_id
  end
end
