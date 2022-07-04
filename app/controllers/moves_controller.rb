class MovesController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @move = Move.new(strong_params)
    @move.board = @board
    @move.user = current_user
    @move.save

    # BoardChannel.broadcast_to(
    #   @board,
    #   {
    #     notation: params[:move][:notation],
    #     fen: params[:move][:fen]
    #   }
    # )
    # head :ok
    # redirect_to board_path(@board)
  end

  private

  def strong_params
    params.require(:move).permit(:notation, :fen)
  end
end
