class BoardsController < ApplicationController
  before_action :set_board, only: :show

  def index
    @boards = Board.order(created_at: :desc).fetch_page(params_index)
  end

  def show; end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(create_params)
    if @board.save
      flash[:success] = 'Board was created successfully!'
      redirect_to board_path(@board.id)
    else
      flash[:error] = @board.errors.messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:board).permit(:email, :name, :width, :height, :num_of_mine)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
