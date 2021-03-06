class CommentsController < ApplicationController
  before_action :correct_user3, only: [:create]
  before_action :correct_user4, only: [:destroy]
  # コメントを保存、投稿するためのアクションです。
  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic

    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.json { render :show, status: :created, location: @comment }
        # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render action: 'index'
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def correct_user3
      unless current_user.friend
        redirect_to(root_url)
      end
    end
    def correct_user4
      unless current_user.friend
        redirect_to(root_url)
      end
    end

end
