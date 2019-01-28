class AddFieldsToPhotographer < ActiveRecord::Migration[5.2]
  def change
    add_column :photographers, :name, :string
    add_column :photographers, :phone, :string
    add_column :photographers, :location, :string
    add_column :photographers, :hourly_rate, :decimal
    add_column :photographers, :service, :decimal
    add_column :photographers, :description, :string
  end
end
