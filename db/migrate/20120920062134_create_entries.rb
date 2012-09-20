class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :positive
      t.string :negative

      t.timestamps
    end
  end
end
