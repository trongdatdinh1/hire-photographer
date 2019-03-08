class AddFieldsToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :name, :string
    add_column :customers, :phone, :string
    add_column :customers, :provider, :string
    add_column :customers, :uid, :string
    add_column :customers, :image, :string
  end
end
