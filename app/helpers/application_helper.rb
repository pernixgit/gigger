module ApplicationHelper
  require 'uri'

  def current_user_type
    current_user.band || current_user.musician || current_user.client if current_user
  end

  def new_user?
    current_user.band.nil? && current_user.musician.nil? && current_user.client.nil?
  end

  def default_image_path
    '/images/original/missing.png'
  end

  def get_youtube_thumbnail(youtube_link)
    query_string = URI.parse(youtube_link).query
    parameters = Hash[URI.decode_www_form(query_string)]
    "http://img.youtube.com/vi/#{parameters['v']}/default.jpg"
  end
end
