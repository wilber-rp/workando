class MatchesController < ApplicationController
  def index
    @match = Match.all
  end

  def create
    if current_user.candidate.matches.none? { |match| match.job_id == (params[:job_id].to_i) }
      @match = Match.new(match_params)
      @match.candidate = current_user.candidate
      if params[:dislike] == "false"
        if @match.save
          redirect_to root_path, notice: 'Candidatura efetuada'
        else
          puts 'Erro'
        end
      else
        if @match.save
          redirect_to root_path, notice: 'Desinteresse cadastrado'
        else
          puts 'Erro'
        end
      end
    else
      puts "Erro"
    end
  end


  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to job_path(@match.job)
  end

  private

  def match_params
    params.permit(:job_id, :dislike)
  end
end
