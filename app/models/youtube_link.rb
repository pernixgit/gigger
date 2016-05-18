class YoutubeLink < ActiveRecord::Base
  belongs_to :band
  belongs_to :musician

  validates :url, presence: true
end
