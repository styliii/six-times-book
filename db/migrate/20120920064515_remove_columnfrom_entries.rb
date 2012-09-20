class RemoveColumnfromEntries < ActiveRecord::Migration
  def up
     remove_column :entries, :sanskrit
  end

  def down
  end
end
