class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
