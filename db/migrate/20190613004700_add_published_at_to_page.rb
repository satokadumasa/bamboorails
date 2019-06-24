class AddPublishedAtToPage < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :published_at, :datetime, default: -> { 'NOW()' }
  end
end
