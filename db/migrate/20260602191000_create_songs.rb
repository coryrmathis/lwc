class CreateSongs < ActiveRecord::Migration[7.2]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.integer :bpm
      t.integer :length_seconds
      t.text :lyrics
      t.text :notes
      t.string :status, null: false, default: "idea"
      t.string :key
      t.boolean :is_cover, null: false, default: false
      t.string :original_artist

      t.timestamps
    end
  end
end
