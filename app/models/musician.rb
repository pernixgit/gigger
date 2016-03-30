class Musician < User
  belongs_to :band, class_name: 'User'
end
