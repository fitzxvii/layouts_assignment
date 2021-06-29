class PostsController < ApplicationController
  layout "threecol"
  def index
    @posts = Post.all.joins(:user)
    @users = User.all
  end

  def create
    @create_post = Post.create(post_params)
    @create_post.errors.full_messages.each do |error|
      flash[:title] = error if error[0..4] == "Title"
      flash[:content] = error if error[0..6] == "Content"
      flas[:user_id] = error if error[0..3] == "User"
    end
    redirect_to "/posts"
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
