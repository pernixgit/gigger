class Musician < ActiveRecord::Base
  
  belongs_to :band
  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :genres

  has_one :user

  validates :name, :last_name, :phone, :identification, presence: true
end
