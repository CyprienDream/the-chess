class BoardsController < ApplicationController
  def show
    @board = Board.find(params[:id])
    @move = Move.new
  end

  def create
    other_user = User.where(username: params[:username])[0]
    if other_user.valid?
      board = Board.new
      board.users << current_user
      board.users << other_user
      board.save
      redirect_to board_path(board)
    else
      redirect_to root_path
      flash[:alert] = 'Error'
    end
  end
end
