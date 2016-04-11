class PagesController < ApplicationController

  before_action :authenticate_user!

  def define_user_type;  end

end
