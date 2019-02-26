class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :post, foreign_key: true
      t.references :photographer, foreign_key: true

      t.timestamps
    end

    add_index :requests, [:post_id, :photographer_id], unique: true
  end
end
