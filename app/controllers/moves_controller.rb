class MovesController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @move = Move.new(strong_params)
    @move.board = @board
    @move.user = current_user
    return unless @move.save

    BoardChannel.broadcast_to(
      @board,
      '1'
    )
    head :ok
    # redirect_to board_path(@board)
    # {
    #   notation: params[:move][:notation],
    #   fen: params[:move][:fen]
    # }
  end

  private

  def strong_params
    params.require(:move).permit(:notation, :fen)
  end
end
