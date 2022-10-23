class DropLiveCompetitions < ActiveRecord::Migration[6.1]
  def change
    drop_table :live_competitions
  end
end
