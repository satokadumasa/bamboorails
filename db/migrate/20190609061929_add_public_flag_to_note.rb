class AddPublicFlagToNote < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :public_status, :integer, default: 0
  end
end
