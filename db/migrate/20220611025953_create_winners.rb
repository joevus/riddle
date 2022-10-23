class CreateWinners < ActiveRecord::Migration[6.1]
  def change
    create_table :winners do |t|
      t.integer :competition_id
      t.text :name
      t.text :email
      t.bigint :rank
      t.timestamps
    end
  end
end
