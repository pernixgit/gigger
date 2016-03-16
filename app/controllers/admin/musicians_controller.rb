class Admin::MusiciansController <ApplicationController

  def index

    @musicians = current_user.musicians
  end
end
