class Musician < User
  belongs_to :band, class_name: 'User'

  validates :name, :last_name, :phone, :email, :identification, presence: true
end
