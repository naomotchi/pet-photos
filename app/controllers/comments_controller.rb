class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], photo_id: comment_params[:photo_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to photo_path(params[:photo_id]) }
      format.json
    end
  end

  private
  def comment_params
    params.permit(:text, :photo_id)
  end

end
