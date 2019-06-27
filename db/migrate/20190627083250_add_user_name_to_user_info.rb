class AddUserNameToUserInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :user_infos, :user_name, :string, :null => false, :limit => 32, :default => ''
  end
end
