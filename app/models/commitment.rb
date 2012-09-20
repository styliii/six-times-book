class Commitment < ActiveRecord::Base
  attr_accessible :description, :sanskrit
  has_many :entries
end
