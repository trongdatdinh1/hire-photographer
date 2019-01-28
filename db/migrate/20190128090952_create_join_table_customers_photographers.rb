class CreateJoinTableCustomersPhotographers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :customers, :photographers do |t|
      t.index :customer_id
      t.index :photographer_id
    end
  end
end
