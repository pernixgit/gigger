class EventType < ActiveRecord::Base
  has_many :events
  has_many :bands
  has_many :musicians

  validates :name, presence: true
end
