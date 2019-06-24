class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.integer :user_id
      t.string :title, :null => false, :limit => 128
      t.text :body

      t.timestamps
    end
  end
end
