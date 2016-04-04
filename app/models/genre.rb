class Genre < ActiveRecord::Base
  has_and_belongs_to_many :musicians
  has_and_belongs_to_many :bands

  validates :name, presence: true
end
