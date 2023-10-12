class PostsController < ApplicationController
  load_and_authorize_resource
  protect_from_forgery with: :null_session
  before_action :set_post, only: %i[ show edit update destroy ]

  def index

    if params[:topic_id].nil?
      @post = Post.all.page(params[:page])
    else
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.all
    end

  end

  def new
    @tag=Tag.all
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def read
    post=Post.find(params[:post_id])
    puts "stage 1"
    if post.users.where("id=#{params[:user_id]}").count==0
      puts "stage 2"
      user=User.find(params[:user_id])
      post.users << user
      puts "success add"
    end
  end

  def show
    @rating=@post.ratings.group(:no).count
    @star=Rating.new
    @topic = Topic.find(params[:topic_id])
    @comment=@post.comments.all
    @tag=@post.tags.all
  end

  def edit
    @tag=Tag.all
    @topic = Topic.find(params[:topic_id])
  end

  def update
    @topic = Topic.find(params[:topic_id])

    respond_to do |format|
      if @post.update(post_params)
        @post.tags.clear
        params[:post][:check].each do |check|
          if check!="0"
            tag=Tag.find(check)
            @post.tags << tag
          end
        end
        format.html { redirect_to topic_post_path(@topic,@post), notice: "post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def create
    @topic = Topic.find(params[:topic_id])
    puts "check parameters #{params[:post][:tags]}"
    @post = @topic.posts.new(post_params)
    @post.user_id=current_user.id

    respond_to do |format|
      if @post.save
        params[:post][:tags].each do |check|
          if check!="0"
            tag=Tag.find(check)
            @post.tags << tag
          end
        end
        format.html { redirect_to topic_posts_path(@topic), notice: "Post was successfully created." }
        format.js
      else
        puts "facing problem"
        format.html { redirect_to new_topic_post_path(@topic), status: :unprocessable_entity,notice: "Post has facing problem." }
        format.js
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
      params.require(:post).permit(:name, :description, :post_profile)
    end
end
