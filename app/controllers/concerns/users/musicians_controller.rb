class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def new
    @musician = Musician.new

  end

  def create
    @musician = Musician.new(musician_params)
    @musician.save
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    @musician = Musician.find(params[:id])
    @musician.update(musician_params)
  end

  def destroy
    @musician = Musician.find(params[:id])
    @musician.destroy
  end

  private

  def musician_params
    params.require(:musician).permit(:name, :address)
  end


end
