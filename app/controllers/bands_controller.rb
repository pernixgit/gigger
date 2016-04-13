class BandsController < InheritedResources::Base

  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_band, except: [:index, :new, :create]

  def index
    @bands = Band.all
  end

  def show; end

  def edit; end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_path
    else
      render 'new'
    end
  end

  def destroy
    @band.destroy
    redirect_to bands_path
  end

  def update
    if @band.update(band_params)
      redirect_to band_path(@band)
    else
      render 'edit'
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :phone)
  end

  def find_band
    @band = Band.find(params[:id])
  end

end
