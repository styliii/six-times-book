class AddSanskritToCommitment < ActiveRecord::Migration
  def change
    add_column :commitments, :sanskrit, :string
  end
end
