class Instrument < ActiveRecord::Base
  has_and_belongs_to_many :musicians
  belongs_to :instrument_type

  validates :name, presence: true
end
