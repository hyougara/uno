class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]

  def index  
    @posts = Post.all
    # @q = current_user.posts.ransack(params[:q])
    # @posts = @q.result.page( params[:page])
  end

  def show
    @user = @post.user
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: '投稿しました'
    else
      render :new 
    end
  end

  def update
      if @post.update(post_params)
        redirect_to root_path, notice: '更新しました'
      else
        render :edit 
      end
  end

  def destroy
    @post.destroy
      redirect_to posts_url, notice: '削除しました'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content,:user_id)
    end

    
end
