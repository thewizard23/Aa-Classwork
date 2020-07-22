class PostsController < ApplicationController
    
  before_action :require_logged_in, only: [:create, :destroy]

  def new 
      @post = Post.new
      render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to sub_url(@post.sub_id)
    else
        flash[:errors] = @post.errors.full_messages 
        render :new
    end
  end 

  def edit
    @post = current_user.posts.find_by(id: params[:id])
    render :edit
  end
  
  def update 
     @post = current_user.posts.find_by(id: params[:id])
      if @post.update(post_params)
          redirect_to sub_url(@post.sub_id)
      else
          flash[:errors] = @post.errors.full_messages
          render :edit
      end
  end

  def destroy 
    @post = current_user.posts.find_by(id: params[:id])
    if @post 
        @post.destroy
        redirect_to sub_url(params[:sub_id])
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :sub_id)
  end
end
