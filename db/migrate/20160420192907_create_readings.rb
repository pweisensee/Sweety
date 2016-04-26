class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.integer :glucose_level

      t.timestamps null: false

      t.integer :user_id
      t.date :created_on
    end
  end
end
