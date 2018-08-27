class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
  end

  def show
    @favorite = current_user.favorites.find_by(feed_id: @feed.id)
    @user = User.find_by(id: @feed.user_id)
  end

  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
    binding.pry
    @feed.user_id = current_user.id


    render :new if @feed.invalid?
  end

  def edit; end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
      if @feed.save
        FeedMailer.feed_mail(@feed).deliver
        redirect_to feed_path(@feed.id), notice: 'Feed was successfully created.'
      else
        render :new
      end
  end

  def update
    @feed.user_id = current_user.id
    if @feed.update(feed_params)
      redirect_to @feed, notice: 'Feed was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_feed
      @feed = Feed.find(params[:id])
    end

    def feed_params
      params.require(:feed).permit(:image, :image_cache, :content, :user_id)
    end

end
