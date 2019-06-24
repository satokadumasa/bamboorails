class RenameForumCategoryIdToForums < ActiveRecord::Migration[5.2]
  def change
  	rename_column :forums, :category_id, :forum_category_id
  end
end
