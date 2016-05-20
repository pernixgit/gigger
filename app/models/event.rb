class Event < ActiveRecord::Base
  include Filterable

  scope :event_type, -> (event_type) { where(event_type_id: event_type) }
  scope :starts_with, -> (name) { where('name like ?', "%#{name}%") }

  belongs_to :client
  belongs_to :event_type

  validates :name, :date, :time, :phone, :email, :description, presence: true

  has_attached_file :image, styles: { small: '64x64', med: '100x100', large: '200x200' }

  validates_attachment :image,
                       content_type: { content_type: %w(image/jpg image/png image/jpeg) },
                       size: { in: 0..2048.kilobytes }, default_url: '/assets/missing.png'
end
