class CreateLoungeMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :lounge_members do |t|
      t.integer :lounge_id
      t.string :user_name, limit: 32
      t.integer :user_id
      t.string :image_path, limit: 255

      t.timestamps
    end
  end
end
