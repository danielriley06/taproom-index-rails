class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :style
      t.float :abv
      t.text :description
      t.integer :brewery_id

      t.timestamps null: false
    end
    add_index :beers, :brewery_id
  end
end
