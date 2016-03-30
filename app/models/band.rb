class Band < User
  has_many :musicians, class_name: 'User'
end
