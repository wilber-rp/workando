class MatchesController < ApplicationController
  def create
    @match = Match.new(match_params)
    @match.candidate = current_user.candidate

    if @match.save
      puts "Successo"
    else
      puts "Erro"
    end
  end

  private

  def match_params
    params.permit(:job_id)
  end
end
