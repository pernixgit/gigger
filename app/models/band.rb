class Band < ActiveRecord::Base
  include Filterable

  scope :event_type, -> (event_type) { includes(:event_types).where(id: event_type) }
  scope :genre, -> (genre) { includes(:genres).where(id: genre) }
  scope :starts_with, -> (name) { where('name like ?', "%#{name}%") }
  
  has_many :musicians
  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :genres

  has_one :user

  validates :name, :phone, presence: true
end
