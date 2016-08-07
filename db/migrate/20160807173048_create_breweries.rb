class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :city
      t.string :country
      t.integer :postal_code
      t.string :state
      t.string :telephone
      t.string :type
      t.boolean :has_pub

      t.timestamps null: false
    end
  end
end
