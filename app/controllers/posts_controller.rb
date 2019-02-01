class PostsController < ApplicationController
        before_action :post, only: [:show, :edit, :update]

    def index 
        @posts = Post.all.order("created_at DESC")
    end

    def new 
        @post = Post.new
    end

    def create
        @post = Post.new(posts_params)
        if @post.save 
            redirect_to @post
        else 
            render 'new'
        end
    end

    def show
    end

    def update
        if @post.update(posts_params)
            redirect_to @post 
        else  
            render 'edit'
        end
    end

    def edit
    end

    def delete
    end

    private
    
    def post
        @post = Post.find(params[:id])
    end

    def posts_params
        params.require(:post).permit(:title, :content)
    end
end
