class MusiciansController < InheritedResources::Base

  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_musician, except: [:index, :new, :create]

  def index
    @musicians = Musician.filter(params.slice(:event_type, :starts_with, :genre))
  end

  def show; end

  def edit; end

  def new
    @musician = Musician.new
    5.times { @musician.youtube_links.build }
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.user = current_user

    if @musician.save
      redirect_to musicians_path
    else
      render 'new'
    end
  end

  def destroy
    @musician.destroy
    redirect_to musicians_path
  end

  def update
    if @musician.update(musician_params)
      redirect_to musician_path(@musician)
    else
      render 'edit'
    end
  end

  private

  def musician_params
    params.require(:musician).permit(
      :name,
      :last_name,
      :identification,
      :phone,
      :image,
      :youtube_links_attributes => [:url],
      :genre_ids => [],
      :instrument_ids => [],
      :event_type_ids => []
    )
  end

  def find_musician
    @musician = Musician.find(params[:id])
  end

end

