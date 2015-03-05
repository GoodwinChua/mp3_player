class CreateSongs < ActiveRecord::Migration
  def change
    drop_table :songs
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :location
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
