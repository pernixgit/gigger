class Client < ActiveRecord::Base
  
  has_many :events

  has_one :user

  validates :name, :last_name, :phone, :identification, presence: true
end
