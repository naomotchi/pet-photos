class PhotosController < ApplicationController
  
  before_action :move_to_index, except: :index

  def index
    @photo = Photo.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
    else
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id]) 
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.user_id == current_user.id
      @photo.update(photo_params)
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    photo.destroy if photo.user_id == current_user.id
  end


  private

  def photo_params
    params.require(:photo).permit(:name, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
