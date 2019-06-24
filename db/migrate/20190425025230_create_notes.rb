class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title, :null => false, :limit => 128
      t.text :body

      t.timestamps
    end
  end
end
