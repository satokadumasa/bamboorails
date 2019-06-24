class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :user_id
      t.integer :note_id, :null => false ,:default => 0
      t.string :title, :null => false, :limit => 32, :default => ''
      t.text :detail

      t.timestamps
    end
  end
end
