class BandsController < InheritedResources::Base

  private

  def band_params
    params.require(:band).permit()
  end

end

