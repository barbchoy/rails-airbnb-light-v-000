class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.decimal :cleanliness_rating
      t.decimal :location_rating
      t.decimal :value_rating
      t.text :comments
      t.integer :house_id
      t.integer :user_id
    end
  end
end
