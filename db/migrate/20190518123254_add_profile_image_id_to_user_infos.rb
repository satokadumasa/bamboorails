class AddProfileImageIdToUserInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :user_infos, :profile_image_id, :integer
  end
end
