class PlayersController < ApplicationController
  def draw
    player = get_player
    game = get_game
    player.draw
    game.next_turn
    redirect_to game_path(params[:game_id])
  end

  def play_merc
    player = get_player
    game = get_game
    player.play(params[:card_id])
    game.next_turn
    redirect_to game_path(params[:game_id])
  end

  def play_pirate
    player = get_player
    game = get_game
    player.play(params[:card_id], params[:target_id])
    game.next_turn
    redirect_to game_path(params[:game_id])
  end

  private

  def get_game
    Game.find(params[:game_id])
  end

  def get_player
    Player.find(params[:id])
  end

end
