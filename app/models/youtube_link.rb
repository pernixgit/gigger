class YoutubeLink < ActiveRecord::Base
  belongs_to :band
  belongs_to :musician

  validates :url, presence: true

  has_attached_file :image, styles: { small: '64x64', med: '100x100', large: '200x200' }

  validates_attachment :image,
                       content_type: { content_type: %w(image/jpg image/png image/jpeg) },
                       size: { in: 0..2048.kilobytes }, default_url: '/assets/missing.png'

end
