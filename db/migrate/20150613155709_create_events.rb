class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :day_id
      t.text :description
      t.timestamps null: false
    end
  end
end
