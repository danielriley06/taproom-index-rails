class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :ambiance
      t.integer :service
      t.integer :selection
      t.integer :food
      t.integer :value
      t.date :date_visited
      t.text :description
      t.integer :brewery_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :reviews, :user_id
    add_index :reviews, :brewery_id
  end
end
