class Band < User
  has_many :musicians, class_name: 'User'

  validates :name, :phone, :email, presence: true
end
