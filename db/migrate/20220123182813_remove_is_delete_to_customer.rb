class RemoveIsDeleteToCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :is_delete, :boolean
  end
end
