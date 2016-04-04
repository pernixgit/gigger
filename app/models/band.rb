class Band < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :musicians
  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :genres

  validates :name, :phone, :email, presence: true
end
