class Entry < ActiveRecord::Base
  attr_accessible :negative, :positive, :commitment_id
  belongs_to :commitment
  belongs_to :user
  

  
end
