class CreateRemarks < ActiveRecord::Migration[5.2]
  def change
    create_table :remarks do |t|
      t.integer :lounge_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
