class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.references :tournament, foreign_key: true
      t.integer :name

      t.timestamps
    end
  end
end
