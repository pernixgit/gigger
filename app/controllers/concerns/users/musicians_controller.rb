class MusiciansController < ApplicationController
  before_action :set_musician, [:show, :edit, :update, :destroy]
  before_action :find_musician, only: [:instrument]
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
    if @musician.save
    redirect_to_musician_path(@musician)
    else
      render :new
    end
  end


  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    @musician = Musician.find(params[:id])
    if @musician.update(musician_params)

    redirect_to_musician_path(@restaurant)
    else
      render :edit
    end
  end


  def destroy
    @musician = Musician.find(params[:id])
    @musician.destroy
    redirect_to_musicians_path
  end

  def top
    @musicians = Musician.where(stars:3)
  end

  def instrument
    @musician
  end



  private

  def musician_params
    params.require(:musician).permit(:name, :address)
  end

  def find_musician
    @musician = Musician.find(params[:id])
  end


end
