class CreateForumComments < ActiveRecord::Migration[5.2]
  def change
    create_table :forum_comments do |t|
      t.integer :user_id, :null => false, :default => 1
      t.integer :forum_id, :null => false, :default => 1
      t.string :title, :null => false, :limit => 32, :default => ''
      t.text :detail

      t.timestamps
    end
  end
end
