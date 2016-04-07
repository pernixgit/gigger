module ApplicationHelper
  def user_signed_in?
    client_signed_in? || band_signed_in? || musician_signed_in?
  end

  def current_user
    current_band || current_client || current_musician
  end
end
