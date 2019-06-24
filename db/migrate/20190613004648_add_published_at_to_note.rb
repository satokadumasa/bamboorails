class AddPublishedAtToNote < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :published_at, :datetime, default: -> { 'NOW()' }
  end
end
