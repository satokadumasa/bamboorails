class AddPublicStatusToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :public_status, :integer, default: 0
  end
end
