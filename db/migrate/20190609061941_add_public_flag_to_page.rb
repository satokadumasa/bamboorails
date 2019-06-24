class AddPublicFlagToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :public_status, :integer, default: 0
  end
end
