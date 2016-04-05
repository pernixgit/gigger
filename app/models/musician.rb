class Musician < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :band
  has_and_belongs_to_many :instruments
  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :genres

  validates :name, :last_name, :phone, :email, :identification, presence: true
end
