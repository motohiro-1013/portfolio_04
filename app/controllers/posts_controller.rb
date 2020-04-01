class PostsController < ApplicationController

    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def new
        if user_signed_in?
            @post = Post.new
        else
            redirect_to("/users/sign_in")
        end
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:notice]="投稿に成功しました"
            redirect_to("/posts")
        else
            render("posts/new")
        end
    end

    def show

    end

    def edit
        @post = Post.find_by(id: params[:id])
    end

    def update
        @post = Post.find_by(id: params[:id])
        @post.name = params[:name]
        @post.text = params[:text]
        @post.image = params[:image]
        binding.pry
        if @post.save
            flash[:notice]="編集に成功しました"
            redirect_to("/posts")
        else
            render("/posts/edit")
        end
    end

    def destroy
        @post = Post.find_by(id: params[:id])
        @post.destroy
        flash[:notice]="削除に成功しました"
        redirect_to("/posts")
    end

    private

    def post_params
        params.permit(:name, :text, :image)
    end

end
