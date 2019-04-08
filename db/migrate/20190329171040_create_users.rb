class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :balance
      t.integer :guests
      t.boolean :pets, :default => false
      t.boolean :owner, :default => false
    end
  end
end
