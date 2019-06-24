class AddBlockGlagToRelationships < ActiveRecord::Migration[5.2]
  def change
    add_column :relationships, :block_flag, :boolean
  end
end
