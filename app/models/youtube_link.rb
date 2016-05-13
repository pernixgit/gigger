class YoutubeLink < ActiveRecord::Base
  belongs_to :band
  belongs_to :musician

  validate :url, presence: true
end
