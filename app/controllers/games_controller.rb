class GamesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user
      @room_id = current_user.rooms.first.id
      redirect_to "/rooms/#{@room_id}"
    end
  end

  def show
    
  end

end
