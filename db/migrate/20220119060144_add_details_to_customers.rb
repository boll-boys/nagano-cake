class AddDetailsToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name, :string
    add_column :customers, :fist_name, :string
    add_column :customers, :last_name_kana, :string
    add_column :customers, :fist_name_kana, :string
    add_column :customers, :postal_code, :string
    add_column :customers, :address, :string
    add_column :customers, :phon_number, :string
    add_column :customers, :is_delete, :boolean
  end
end
