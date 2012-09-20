class AddSanskritToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :sanskrit, :string
  end
end
