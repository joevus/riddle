class CreateAnswerKey < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_keys do |t|
      t.integer :competition_id
      t.text :key
      t.timestamps
    end
  end
end
