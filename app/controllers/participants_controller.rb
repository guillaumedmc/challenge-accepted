class ParticipantsController < ApplicationController
  def new
    # we need @challenge in our `simple_form_for`
    @challenge = Challenge.find(params[:challenge_id])
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    # we need `challenge_id` to associate participant with corresponding challenge
    @challenge = Challenge.find(params[:challenge_id])
    @participant.challenge = @challenge
    @participant.save
    redirect_to challenges_path
  end

  private

  def participant_params
    params.require(:participant).permit(:challenge, :role, :user_id)
  end
end
