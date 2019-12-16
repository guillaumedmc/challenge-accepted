class ParticipantsController < ApplicationController
  def new
    # we need @challenge in our `simple_form_for`
    @participant = Participant.new
    @challenge = Challenge.find(params[:challenge_id])
  end

  def create
    @participant = Participant.new(participant_params)
    # we need `challenge_id` to associate participant with corresponding challenge
    @challenge = Challenge.find(params[:challenge_id])
    @participant.challenge = @challenge
    # binding.pry
    @participant.save
    if @participant.save!
      redirect_to challenge_path(@challenge), notice: 'Participant was successfully created.'
    else
      render :new
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:challenge_id, :role, :user_id)
  end
end
