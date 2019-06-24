class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.integer :user_id
      t.string :name, :null => false, :limit => 32, :default => ''
      t.string :mobile, :null => false, :limit => 13, :default => ''
      t.integer :pref_id
      t.string :postal_code, :null => false, :limit => 8, :default => ''
      t.string :address, :null => false, :limit => 255, :default => ''

      t.timestamps
    end
  end
end
