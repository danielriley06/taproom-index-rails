class AssociationTable < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.references :user
      t.references :brewery
      t.references :review
      t.timestamps null: false
    end
  end
end
