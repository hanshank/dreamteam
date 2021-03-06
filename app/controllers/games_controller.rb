class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :update, :create]

  def home
  end

  def index
    @games = Game.where.not(:opponent_id => nil)
    @singleplayer = Game.where(:opponent_id => nil)
  end

  def show
    @game = Game.find_by_id(params[:id])
    if @game.blank?
      redirect_to games_path, alert: 'Sorry Game Not Found :(', status: :not_found
    elsif !@game.in_game?(current_user)
      redirect_to games_path, alert: "Couldn\'t join the game as not a player."
    else
      puts @game
    end
   end

  def update
    @game = Game.find_by_id(params[:id])
    if current_user.id == @game.user_id
      flash[:notice] = "Welcome back. Your game is awaiting."
      redirect_to game_path(@game)
    elsif @game.opponent_id.nil?
      @game.update_attributes(opponent_id: current_user.id)
      opponent_pieces = @game.chess_pieces.where(user_id: nil)
      opponent_pieces.each do |x|
        x.update_attributes(user_id: current_user.id)
      end
      redirect_to game_path(@game)
    else
      render plain: 'Couldn\'t join the game. Please try another game', status: :unprocessable_entity
    end
  end


  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    if @game.valid?
      @game.populate_board
      
      redirect_to game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def game_params
    params.require(:game).permit(:game_name, :opponent_id)
  end
end
