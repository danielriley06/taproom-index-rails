class AssociationTable < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.references :user
      t.references :brewery
      t.references :review
      t.date     :date_visited
      t.timestamps null: false
    end
  end
end
