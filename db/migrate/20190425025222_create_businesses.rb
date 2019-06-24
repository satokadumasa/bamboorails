class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.integer :user_id
      t.integer :career_id
      t.string :name, :null => false, :limit => 32, :default => ''
      t.datetime :started_at
      t.datetime :ended_at
      t.text :detail

      t.timestamps
    end
  end
end
