class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :band, -> { where(type: "Band") }
  scope :client, -> { where(type: "Client") }
  scope :musician, -> { where(type: "Musician") }
end
