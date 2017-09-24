class GroupChangeEntries < ActiveRecord::Migration[5.1]
  def change
    remove_reference :entries, :tournament, foreign_key: true
    add_reference :entries, :group, foreign_key: true
  end
end
