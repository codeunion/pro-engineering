class VotesController < ApplicationController
  before_action :set_poll
  before_action :require_authentication!

  # GET /polls/:poll_id/votes/new
  def new
    @vote = Vote.new
  end

  # POST /polls/:poll_id/votes
  def create
    @vote = @poll.votes.build(vote_params)
    @vote.user = current_user

    if @vote.save
      redirect_to @poll, notice: 'Vote was successfully created.'
    else
      render :new
    end
  end

  private

  def set_poll
    @poll = Poll.find(params[:poll_id])
  end

  # Only allow a trusted parameter "white list" through.
  def vote_params
    params.require(:vote).permit(:response)
  end
end
