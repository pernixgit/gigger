class Event < ActiveRecord::Base
  include Filterable

  scope :event_type, -> (event_type) { where event_type_id: event_type}
  scope :starts_with, -> (name) { where('name like ?', "%#{name}%") }

  belongs_to :client
  belongs_to :event_type

  validates :name, :date, :time, :phone, :email, :description, presence: true
end
