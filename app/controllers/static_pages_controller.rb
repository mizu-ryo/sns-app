class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build if logged_in?
#      @comment = current_user.comments.build if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page], per_page: 20)
    end
    
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
