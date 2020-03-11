class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destory, :show]
    before_action :correct_user,   only: :destroy


    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "Post created!"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
            #redirect_to root_url
        end
    end

    def destroy
        @post.destroy
        flash[:success] = "Post deleted"
        redirect_to request.referrer || root_url
    end

    def show
        @post = Post.find(params[:id])
        @comments = @post.comments
        #@comment = @post.comments.build(user_id: current_user.id) if current_user
    end


    private

        def post_params
            params.require(:post).permit(:content)
        end

        def correct_user
            @post = current_user.posts.find_by(id: params[:id])
            redirect_to root_url if @post.nil?
        end

end
