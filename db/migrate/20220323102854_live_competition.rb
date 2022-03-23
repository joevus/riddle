class LiveCompetition < ActiveRecord::Migration[6.1]
  def change
    create_table :live_competitions do |t|
      t.integer :competition_id
      t.timestamps
    end
  end
end
