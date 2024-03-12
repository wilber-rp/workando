class MatchesController < ApplicationController
  def index
    @match = Match.all
  end

  def create
    @match = Match.new(match_params)
    @match.candidate = current_user.candidate

    if @match.save
      puts 'Successo'
    else
      puts 'Erro'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to job_path(@match.job)
  end

  private

  def match_params
    params.permit(:job_id)
  end
end
