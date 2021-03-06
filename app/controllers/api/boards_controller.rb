class Api::BoardsController < ApplicationController
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      render 'show'
    else
      render json: @board.errors.full_messages, status: 422
    end
  end

  def index
    @boards = Item.all
    render "index"
  end


  def show
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])

    if @board.update(board_params)
      render "show"
    else
      render json: @board.errors.full_messages, status: 422
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    render "show"
  end

  private

  def board_params
    params.require(board).permit(:title)
  end
end
