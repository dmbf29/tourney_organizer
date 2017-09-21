class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :rating
      t.string :badge
      t.string :abbrev

      t.timestamps
    end
  end
end
