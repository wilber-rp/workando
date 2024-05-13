class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new
    @match = Match.find(params[:match_id])
    @chatroom.match = @match
    @chatroom.sender = current_user
    @chatroom.receiver = @match.user

    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render 'matches/show'
    end
  end
end
