class PostsController < ApplicationController
  def new
  end

  def share
    @share = Share.new(posts_id: params[:id])
    if @share.save
      flash[:notice] = "レビューを投稿しました"
      redirect_to("/index/#{@current_user.id}")
    end
  end

  def create
    @add_review = Post.new(title: params[:title],
                           author: params[:author],
                           review: params[:review],
                           evaluation: params[:evaluation],
                           user_id: @current_user.id)
    if @add_review.save
      flash[:notice] = "レビューを保存しました"
      redirect_to("/mypage/#{@current_user.id}")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:danger] = "レビューを削除しました"
      redirect_to("/mypage/#{@current_user.id}")
    end
  end

end
