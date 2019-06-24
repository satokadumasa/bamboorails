class CreateDmessages < ActiveRecord::Migration[5.2]
  def change
    create_table :dmessages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.datetime :received_at
      t.datetime :deleted_at
      t.string :title
      t.text :detail

      t.timestamps
    end
  end
end
