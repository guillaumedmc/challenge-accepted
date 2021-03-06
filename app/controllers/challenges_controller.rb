class ChallengesController < ApplicationController
  def index
    if params[:query].present?
      @challenges = Challenge.where(name: params[:query])
    else
      @challenges = Challenge.all
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    @comment = Comment.new
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.user_id = current_user.id
    url = "https://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=#{@challenge.theme}&limit=1&offset=0&rating=G&lang=en"
    user_serialized = open(url).read
    gifs = JSON.parse(user_serialized)
    a = gifs['data'].first
    @challenge.gif = a['images']['downsized_large']['url']
    @challenge.save
    if @challenge.save
      redirect_to challenges_path, notice: 'Challenge was successfully created.'
    else
      render :new
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update(challenge_params)
      redirect_to challenge_path(@challenge), notice: 'Challenge was successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_path, notice: 'Challenge was successfully deleted.'
  end

  def displaygif
    url = "https://api.giphy.com/v1/gifs/search?api_key=#{ENV['GIPHY_API_KEY']}&q=funny&limit=3&offset=0&rating=G&lang=en"
    user_serialized = open(url).read
    gifs = JSON.parse(user_serialized)
    # a = gifs['data']['images']['downsized_large']['url']
    # binding.pry
    gifs
  end

  helper_method :displaygif

  private

  def challenge_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:challenge).permit(:name, :description, :reward, :contenders, :completion_date, :theme, :gif)
  end
end
