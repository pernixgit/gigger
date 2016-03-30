class Client < User
  has_many :events

  validates :name, :last_name, :phone, :email, :identification, presence: true
end
