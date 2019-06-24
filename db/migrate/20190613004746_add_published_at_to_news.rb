class AddPublishedAtToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :published_at, :datetime, default: -> { 'NOW()' }
  end
end
