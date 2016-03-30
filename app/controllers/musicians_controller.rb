class MusiciansController < InheritedResources::Base

  def index
    @musicians = Musician.all
  end

  private

    def musician_params
      params.require(:musician).permit()
    end
end

