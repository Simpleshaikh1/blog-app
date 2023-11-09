class PostsController < ApplicationController
    load_and_authorize_resource
    def index
      @user = User.find(params[:user_id])
      # @posts = @user.posts.includes(:comments)

      # N+1 solution
      page = params[:page] || 1
      per_page = 10

      @posts = Post.includes(:author)
        .includes(:comments)
        .where(author: params[:user_id])
        .order(created_at: :desc)
        .offset((page.to_i - 1) * per_page)
        .limit(per_page)

      @total_pages = (@user.posts.count.to_f / per_page).ceil
      @author = @posts.first.author unless @posts.first.nil?
    end

    def show
      @user = User.find(params[:user_id])
      @post = Post.find(params[:id])
    end

    def new
      @user = current_user
      @post = @user.posts.build
    end

    def create
      @user = current_user
      @post = @user.posts.build(post_params)
    
      if @post.save
        redirect_to user_post_path(@user, @post)
      else
        render 'new'
      end
    end

    private
    
    def post_params
      params.require(:post).permit(:Title, :Text)
    end
end
