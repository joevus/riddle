class AddIsActiveToCompetitions < ActiveRecord::Migration[6.1]
  def change
    add_column :competitions, :is_active, :boolean
  end
end
