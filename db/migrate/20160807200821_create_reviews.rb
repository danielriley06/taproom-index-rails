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

      t.timestamps null: false
    end
  end
end
