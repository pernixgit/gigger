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
      define_user_type_path
    else
      super
    end
  end

end
