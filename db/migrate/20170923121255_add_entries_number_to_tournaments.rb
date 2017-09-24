class AddEntriesNumberToTournaments < ActiveRecord::Migration[5.1]
  def change
    add_column :tournaments, :entries_number, :integer
  end
end
