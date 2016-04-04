class InstrumentType < ActiveRecord::Base
  has_many :instruments

  validates :name, presence: true
end
