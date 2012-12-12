class PlacesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, only: [ :show, :destroy, :edit, :update ]

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params[:place])
    @place.user_id = current_user.id
    if @place.save
      redirect_to places_path
    else
      render 'new'
    end
  end

  def index
    @places = Place.where('user_id = ?', current_user.id)
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
  end

  def destroy
    @place.destroy
    flash[:success] = 'Place deleted'
    redirect_to places_path
  end

  def update
    if @place.update_attributes(params[:place])
      flash[:success] = 'Place updated'
      redirect_to @place
    else
      render 'edit'
    end
  end

  private

  def correct_user
    @place = Place.find(params[:id])
    owner = @place.user
    redirect_to places_path unless current_user == owner
  end
end
