class BlogsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]


    def index
      @blogs = Blog.all.order("created_at DESC").page(params[:page]).per(5)
    end

    def new
    @blog = Blog.new
    end

    def create
    Blog.create(blog_params)
    end

    def show
      @blog = Blog.find(params[:id])
    end

    def destroy
    blog = Blog.find(params[:id])
      if blog.user_id == current_user.id
        blog.destroy
      end
    redirect_to action: :index
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def update
       blog = Blog.find(params[:id])
       blog.update(blog_params)
       redirect_to action: :index
    end

    private
    def blog_params
    params.require(:blog).permit(:title, :text).merge(user_id: current_user.id )
    end

    def move_to_index
    redirect_to action: :index unless user_signed_in?
    end
end
