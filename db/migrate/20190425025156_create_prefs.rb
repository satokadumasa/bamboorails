class CreatePrefs < ActiveRecord::Migration[5.2]
  def change
    create_table :prefs do |t|
      t.string :name, :null => false, :limit => 32, :default => ''

      t.timestamps
    end
  end
end
