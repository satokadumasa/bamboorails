class CreateWatchForums < ActiveRecord::Migration[5.2]
  def change
    create_table :watch_forums do |t|
      t.integer :user_id
      t.integer :forum_id

      t.timestamps
    end
  end
end
