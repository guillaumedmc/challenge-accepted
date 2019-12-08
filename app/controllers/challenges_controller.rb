class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.save

    redirect_to challenges_path
  end

  def edit
    @challenge = Challenge.find(params[:id])
    @challenge.update(challenge_params)
  end

  def update
    @challenge = Challenge.find(params[:id])
    @challenge.update(params[:challenge])
  end

  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy
    redirect_to challenges_path
  end

  private

  def challenge_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:challenge).permit(:name, :description, :reward)
  end
end
