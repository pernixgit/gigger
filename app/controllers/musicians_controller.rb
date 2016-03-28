class MusiciansController < InheritedResources::Base

  private

    def musician_params
      params.require(:musician).permit()
    end
end

