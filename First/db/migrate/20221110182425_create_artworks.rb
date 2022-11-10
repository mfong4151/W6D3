class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false, index:{unique: true}
      t.references :artist, null: false, index:{unique: false}
      t.index [:title, :artist_id], unique: true
       
      t.timestamps
    end
  end
end
