class UpdateAlbumTypeTag < ActiveRecord::Migration
  def change
    add_column :albums, :recording_type, :string, default: "studio"
  end
end
