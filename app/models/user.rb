class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  has_many :entries
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(email,password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def next_commitment    
    unless self.previous_commitment.nil?
      Commitment.find(self.previous_commitment.id+1)
    else
      Commitment.first
    end
  end
  
  def previous_commitment
    unless self.entries.empty? 
      self.entries.last.commitment 
    else
      nil
    end
  end
  
end
