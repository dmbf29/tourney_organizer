class AddKnockoutForGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :round, :integer, default: 0
    add_column :games, :knockout_name, :integer
  end
end
