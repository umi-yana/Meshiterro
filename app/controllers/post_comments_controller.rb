class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:id])
    comment = current_user.post_comment.new(post_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)

  end

  def destroy
    # 質問　（なぜにfind_byメソッドを使うのか？今までfindだった）
    PostComments.find_by(id: params[:id],post_image_id:params[:post_image_id]).destroy
    redirect_to post_image_path(params[:post_image_id])
    
  end


  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
