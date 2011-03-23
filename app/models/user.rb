class User < ActiveRecord::Base
  has_many :tokens
  has_many :clients, :through => :tokens
  
  # we may want a smart hmt relationship for active and inactive clients (based on tokens)
  
  validates_presence_of :name
end