class AddOwnerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :boolean, :owner
  end
end
