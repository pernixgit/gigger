class Event < ActiveRecord::Base
  belongs_to :client

  validates :name, :date, :description, presence: true
end
