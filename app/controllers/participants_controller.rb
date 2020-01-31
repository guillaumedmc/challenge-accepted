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
    @participant.role = 'Contender'
    @participant.save
    if @participant.save
      redirect_to challenge_path(@challenge), notice: 'Participant was successfully created.'
    else
      render :new
    end
  end

  def edit
    @challenge = Challenge.find(params[:challenge_id])
    @participant = Participant.find(params[:id])
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update(participant_params)
      redirect_to challenge_path(@participant.challenge), notice: 'Result was registered'
    else
      render :edit, notice: 'Result was NOT registered'
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:challenge_id, :role, :user_id, :rank)
  end
end
