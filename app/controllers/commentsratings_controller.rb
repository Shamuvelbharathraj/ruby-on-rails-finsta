class CommentsratingsController < ApplicationController
  before_action :set_commentsrating, only: %i[ show edit update destroy ]
  before_action :set_topic, only: %i[ show edit create update destroy ]
  before_action :set_post, only: %i[ show edit create update destroy ]
  before_action :set_comment, only: %i[ show edit create update destroy ]


  # GET /commentsratings or /commentsratings.json
  def index
    @commentsratings = Commentsrating.all
  end

  # GET /commentsratings/1 or /commentsratings/1.json
  def show
  end

  # GET /commentsratings/new
  def new
    @commentsrating = Commentsrating.new
  end

  # GET /commentsratings/1/edit
  def edit
  end

  # POST /commentsratings or /commentsratings.json
  def create
    @commentsrating = @comment.commentsratings.new(commentsrating_params)
    @commentsrating.user_id=current_user.id;

    respond_to do |format|
      if @commentsrating.save
        format.html { redirect_to topic_post_path(@topic,@post), notice: "Commentsrating was successfully created." }
        format.json { render :show, status: :created, location: @commentsrating }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @commentsrating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commentsratings/1 or /commentsratings/1.json
  def update
    respond_to do |format|
      if @commentsrating.update(commentsrating_params)
        format.html { redirect_to commentsrating_url(@commentsrating), notice: "Commentsrating was successfully updated." }
        format.json { render :show, status: :ok, location: @commentsrating }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commentsrating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commentsratings/1 or /commentsratings/1.json
  def destroy
    @commentsrating.destroy

    respond_to do |format|
      format.html { redirect_to commentsratings_url, notice: "Commentsrating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentsrating
      @commentsrating = Commentsrating.find(params[:id])
    end

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:comment_id])
    end


    # Only allow a list of trusted parameters through.
    def commentsrating_params
      params.require(:commentsrating).permit(:no)
    end
end
