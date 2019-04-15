class CreateStay < ActiveRecord::Migration[5.2]
  def change
    create_table :stays do |t|
      t.integer :guest_id
      t.integer :house_id
    end
  end
end
