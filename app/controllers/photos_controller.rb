class PhotosController < ApplicationController
  
  before_action :move_to_index, except: :index

  def index
    @photo = Photo.with_attached_images.order("id DESC").limit(8).page(params[:page]).per(5)
  end

  def new
    @photo = Photo.new
  end

  def create
    Photo.create(name: photo_params[:name], images: photo_params[images: []], text: photo_params[:text], user_id: current_user.id)
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
    params.require(:photo).permit(:name, :text, images: [])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
