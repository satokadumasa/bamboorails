class CreateCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :careers do |t|
      t.integer :user_id
      t.string :name, :null => false, :limit => 64, :default => ''
      t.text :detail
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
