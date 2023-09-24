class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.all
    puts @post
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def show
    @topic = Topic.find(params[:topic_id])
  end

  def edit
    @topic = Topic.find(params[:topic_id])
  end

  def update
    @topic = Topic.find(params[:topic_id])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topic_post_path(@topic,@post), notice: "post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to topic_posts_path(@topic), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to topic_posts_path(@topic), notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:name, :description)
    end
end
