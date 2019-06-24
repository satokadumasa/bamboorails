class CreateAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :agreements do |t|
      t.string :tiele
      t.text :outline
      t.text :detail

      t.timestamps
    end
  end
end
