class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.text :title
      t.references :photographer, foreign_key: true
      t.timestamps
    end
  end
end
