class GameRoomsController < ApplicationController

  def create
    game_room = GameRoom.new(
                            game_id: params[:game_id],
                            room_id: params[:room_id]
                            )
  end

end
