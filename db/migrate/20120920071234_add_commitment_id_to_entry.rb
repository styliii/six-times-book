class AddCommitmentIdToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :commitment_id, :integer
  end
end
