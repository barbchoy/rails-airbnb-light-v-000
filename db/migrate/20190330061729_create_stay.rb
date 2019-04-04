class CreateStay < ActiveRecord::Migration[5.2]
  def change
    create_table :stays do |t|
      t.string :guest_id
      t.string :house_id
    end
  end
end
