class RatingChangeFloat < ActiveRecord::Migration[5.1]
  def change
    remove_column :teams, :rating, :string
    add_column :teams, :rating, :float
  end
end
