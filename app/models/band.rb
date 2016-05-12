class Band < ActiveRecord::Base
  include Filterable

  scope :event_type, -> (event_type) { includes(:event_types).where(id: event_type) }
  scope :genre, -> (genre) { includes(:genres).where(id: genre) }
  scope :starts_with, -> (name) { where('name like ?', "%#{name}%") }
  
  has_many :musicians
  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :genres

  has_one :user

  validates :name, :phone, presence: true

  has_attached_file :image, styles: { small: '64x64', med: '100x100', large: '200x200' }

  validates_attachment :image,
                       content_type: { content_type: %w(image/jpg image/png image/jpeg) },
                       size: { in: 0..2048.kilobytes }, default_url: '/assets/missing.png'
end
