class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.integer :winner_id
      t.date :date

      t.timestamps
    end
  end
end
