class CreatePrize < ActiveRecord::Migration[6.1]
  def change
    create_table :prizes do |t|
      t.integer :competition_id
      t.text :code
      t.text :description
      t.bigint :rank
      t.timestamps
    end
  end
end
