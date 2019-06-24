class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.string :title, :null => false, :limit => 128
      t.text :detail
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
