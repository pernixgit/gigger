class Band < ActiveRecord::Base
  
  has_many :musicians
  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :genres

  has_one :user

  validates :name, :phone, presence: true
end
