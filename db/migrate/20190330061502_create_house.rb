class CreateHouse < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :price_per_night
      t.string :city
      t.integer :max_guests
      t.integer :cleanliness_rating
      t.integer :location_rating
      t.integer :value_rating
      t.integer :reviews_count
    end
  end
end
