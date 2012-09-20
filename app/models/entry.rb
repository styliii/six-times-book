class Entry < ActiveRecord::Base
  attr_accessible :negative, :positive, :commitment_id
  belongs_to :commitment
  
  def next_commitment    
    unless self.previous_commitment == Commitment.last
      Commitment.find(self.previous_commitment.id + 1)
    else
      Commitment.first
    end
  end
  
  def previous_commitment
    if Entry.last
      Entry.last.commitment 
    else
      Commitment.last
    end
  end
  
end
