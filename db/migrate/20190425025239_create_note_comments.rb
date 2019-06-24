class CreateNoteComments < ActiveRecord::Migration[5.2]
  def change
    create_table :note_comments do |t|
      t.integer :user_id
      t.integer :note_id
      t.string :title, :null => false, :limit => 128
      t.text :body

      t.timestamps
    end
  end
end
