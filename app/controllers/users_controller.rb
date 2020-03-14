class UsersController < ApplicationController
  def index
    @share = Share.all
    @posts = Post.all
    @share = @share.order(created_at: :desc)
  end

  def search
    @shares = Share.all
    @search = Post.where(title: params[:search]).or(Post.where(author: params[:search]))
    @text = params[:search]

  end

  def mypage
    @user = User.find_by(id: @current_user.id)
    @posts = Post.where(user_id: @current_user.id)
    @posts = @posts.order(created_at: :desc)
  end

  def like
    @user = User.find_by(id: @current_user.id)
    @likes = Like.where(user_id: @current_user.id)
    @posts = Post.all
  end

  def add_like
    @like = Like.new(user_id: @current_user.id,
                     posts_id: params[:id])
    @like.save
    redirect_to("/index/#{@current_user.id}")
  end

  def destroy_like
    @like = Like.find_by(id: params[:id])
    if @like.destroy
      flash[:danger] = "お気に入りから削除しました"
      redirect_to("/like/#{@current_user.id}")
    end
  end

  def sign_up
  end

  def user_create
    @user = User.new(name: params[:name],
                    email: params[:email],
                    password: params[:password])
    if @user.save
      session[:user_id] = @user.id
    end

    redirect_to("/index/#{@user.id}")
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email],
                    password: params[:password])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/index/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      render("/users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

end
