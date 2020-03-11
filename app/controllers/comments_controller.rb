class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user,    only: :destroy
  
  def create
    @comment = current_user.comments.build(content: params[:comment][:content], post_id:params[:post_id] )
    if @comment.save
      flash[:success] = 'comment create.'
      redirect_to root_url
    else
      redirect_to root_url
      #render 'static_pages/home'
    end

  end

  def destroy
    @comment.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
  end

  private
    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
