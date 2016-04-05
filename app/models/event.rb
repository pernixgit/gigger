class Event < ActiveRecord::Base
  belongs_to :client
  belongs_to :event_type

  validates :name, :date, :time, :phone, :email, :description, presence: true
end
