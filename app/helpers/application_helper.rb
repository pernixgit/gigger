module ApplicationHelper
  def current_user_type
    current_user.band || current_user.musician || current_user.client
  end

  def new_user?
    current_user.band.nil? && current_user.musician.nil? && current_user.client.nil?
  end
end
