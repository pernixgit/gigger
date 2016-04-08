module ApplicationHelper
  def current_user_type
    current_user.band || current_user.musician || current_user.client
  end
end
