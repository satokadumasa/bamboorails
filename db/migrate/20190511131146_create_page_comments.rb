class CreatePageComments < ActiveRecord::Migration[5.2]
  def change
    create_table :page_comments do |t|
      t.integer :user_id, :null => false, :default => 1
      t.integer :page_id, :null => false, :default => 1
      t.string :title, :null => false, :limit => 64, :default => ''
      t.text :detail

      t.timestamps
    end
  end
end
