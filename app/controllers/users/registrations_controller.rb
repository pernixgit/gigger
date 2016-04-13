class Users::RegistrationsController < Devise::RegistrationsController
  
  
  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  protected

  def after_sign_up_path_for(resource)
    case resource
    when :user, User
      resource.user? ? define_user_type_path : root_path
    else
      super
    end
  end

end
