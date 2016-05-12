class Client < ActiveRecord::Base
  
  has_many :events

  has_one :user

  validates :name, :last_name, :phone, :identification, presence: true

  has_attached_file :image, styles: { small: '64x64', med: '100x100', large: '200x200' }

  validates_attachment :image,
                       content_type: { content_type: %w(image/jpg image/png image/jpeg) },
                       size: { in: 0..2048.kilobytes }, default_url: '/assets/missing.png'
end
