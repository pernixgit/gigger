class MusiciansController < InheritedResources::Base

  before_action :find_musician, except: [:index, :new, :create]

  def index
    @musicians = Musician.all
  end

  def show; end

  def edit; end

  def create
    @musician = Musician.new(musician_params)

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
      :email,
      :password
    )
  end

  def find_musician
    @musician = Musician.find(params[:id])
  end

end

