class CreatePlaylistsongs < ActiveRecord::Migration
  def change
    drop_table :playlistsongs
    create_table :playlistsongs do |t|
      t.integer :song_id
      t.integer :playlist_id

      t.timestamps null: false
    end
  end
end
