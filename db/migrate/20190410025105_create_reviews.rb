class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :title
      t.integer :cleanliness_rating
      t.integer :location_rating
      t.integer :value_rating
      t.text :comments
      t.integer :house_id
      t.integer :user_id

      t.timestamps
    end
  end
end
