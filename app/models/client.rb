class Client < ActiveRecord::Base
  has_many :tokens
  has_many :users, :through => :tokens
  
  # needs further validations
  validates_presence_of :client_id, :client_secret
end