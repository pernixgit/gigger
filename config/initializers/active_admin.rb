ActiveAdmin.setup do |config|
  config.site_title = "Gigger Administrator"

  config.comments = false

  config.show_comments_in_menu = false

  config.batch_actions = true

  config.current_user_method = :current_admin_user

  config.authentication_method = :authenticate_admin_user!

  config.logout_link_path = :destroy_admin_user_session_path
end
