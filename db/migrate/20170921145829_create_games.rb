class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.integer :winner_id
      t.integer :loser_id
      t.integer :entry_home_score
      t.integer :entry_away_score
      t.integer :entry_home_score_aet
      t.string :entry_away_score_aet
      t.boolean :draw
      t.integer :entry_home_id
      t.integer :entry_away_id
      t.references :tournament, foreign_key: true
      t.references :group, foreign_key: true
      t.references :screen, foreign_key: true

      t.timestamps
    end
  end
end
