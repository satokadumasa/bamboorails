class CreateLounges < ActiveRecord::Migration[5.2]
  def change
    create_table :lounges do |t|
      t.integer :user_id
      t.string :title, :limit => 64, :default => ''
      t.text :overview
      
      t.timestamps
    end
  end
end
