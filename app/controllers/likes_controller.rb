class LikesController < ApplicationController
  before_action :set_variables

  def create
    like = current_user.likes.create(photo_id: @photo.id)
    like.save
  end

  def destroy
    like = current_user.likes.find_by(photo_id: @photo.id)
    like.destroy
  end

  private

  def set_variables
    @photo = Photo.find(params[:photo_id])
    @id_name = "#like-link-#{@photo.id}"
  end

end