class ChallengesController < ApplicationController
  def index
    @challenges = Challenge.all
  end

  def show
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.save
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def challenge_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:challenge).permit(:name, :description, :reward)
  end
end
