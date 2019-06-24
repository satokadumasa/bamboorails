class CreateForums < ActiveRecord::Migration[5.2]
  def change
    create_table :forums do |t|
      t.integer :user_id, :null => false, :default => 1
      t.integer :category_id, :null => false, :default => 1
      t.string :title, :null => false, :limit => 64, :default => ''
      t.text :detail

      t.timestamps
    end
  end
end
