class Create < ActiveRecord::Migration[6.1]
  def change
    create_table :competitions do |t|
      t.text :name
      t.text :puzzle_text
      t.bigint :correct_answer_count
      t.text :guide
      t.timestamps
    end
  end
end
