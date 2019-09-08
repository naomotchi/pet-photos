class PhotosController < ApplicationController

  def index
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to post_photos_path
    else
      redirect_to :new
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
    @photo.update(photo_params)
    redirect_to @photo
  end

  def destroy
  end

  def post
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :text, :image)
  end

end
