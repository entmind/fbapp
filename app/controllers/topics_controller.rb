class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit]
  before_action :correct_user2, only: [:update]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    if current_user.following?(@topic.user) && @topic.user.following?(current_user)
      @comment = @topic.comments.build
      @comments = @topic.comments
    elsif @topic.user_id == current_user.id
      @comment = @topic.comments.build
      @comments = @topic.comments
    else
      redirect_to(root_url)
    end
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
    @topic.user_id = current_user.id

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'トピックが作成されました。' }
        format.json { render :show, status: :created, location: @topic }
        NoticeMailer.sendmail_topic(@topic).deliver
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'トピックが更新されました。' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'トピックが削除されました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:user_id, :content)
    end

    def correct_user
      unless @topic.user_id == current_user.id
        redirect_to(root_url)
      end
    end
    def correct_user2
      unless @topic.user_id == current_user.id
        redirect_to(root_url)
      end
    end
end
