class PostsController < ApplicationController
  http_basic_authenticate_with name: "desafiovamoscontodo", password: "XAHTJEAS23123%23", only: :dashboard

  def index
    @posts = Post.where('content LIKE ?', "%#{params[:q]}%").order(id: :desc)
  end

  def dashboard
  end

  def create
    @post = Post.create(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:title, :image_url, :content)
  end

end
