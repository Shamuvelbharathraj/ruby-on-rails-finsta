class TagsController < ApplicationController
  before_action :set_topic, only: %i[ index new create show edit update destroy ]
  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /tags or /tags.json
  def index
    unless params[:post_id].nil?
      @post=Post.find(params[:post_id])
    end
    @tag = Tag.all
  end

  # GET /tags/1 or /tags/1.json
  def show
    unless params[:post_id].nil?
      @post=Post.find(params[:post_id])
    end
  end

  # GET /tags/new
  def new
    unless params[:post_id].nil?
      @post=Post.find(params[:post_id])
    end
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
    unless params[:post_id].nil?
      @post=Post.find(params[:post_id])
    end
  end

  # POST /tags or /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        if params[:post_id].nil?
          format.html { redirect_to new_topic_post_path(@topic), notice: "Tag was successfully created." }
        else
          @post=Post.find(params[:post_id])
          format.html { redirect_to edit_topic_post_path(@topic,@post), notice: "Tag was successfully created." }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        if params[:post_id].nil?
          format.html { redirect_to topic_tags_path(@topic), notice: "Tag was successfully updated." }
        else
          @post=Post.find(params[:post_id])
          format.html { redirect_to topic_post_tags_path(@topic,@post), notice: "Tag was successfully updated." }
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy

    if params[:post_id].nil?
      @tag.destroy
    else
      @post=Post.find(params[:post_id])
      @post.tags.delete(@tag)
    end

    respond_to do |format|
      if params[:post_id].nil?
        format.html { redirect_to topic_tags_path(@topic), notice: "Tag was successfully destroyed." }
      else
        format.html { redirect_to topic_post_tags_path(@topic,@post), notice: "Tag was successfully destroyed." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
