class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.references :tournament, foreign_key: true

      t.timestamps
    end
  end
end
