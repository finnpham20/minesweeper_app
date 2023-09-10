# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  email       :string(256)      not null
#  name        :string(256)      not null
#  width       :integer          default(0), not null
#  height      :integer          default(0), not null
#  num_of_mine :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Board < ApplicationRecord
  validates :email, presence: true, format: { with: RegexConstant::EMAIL_FORMAT }, length: { maximum: 2656 }
  validates :name, presence: true, length: { maximum: 2656 }
  validates :name, uniqueness: { scope: :email }
  validates :width, :height, :num_of_mine, presence: true, numericality: { greater_than: 0 }
  validate :max_mine
  before_create :generate_board_data

  private

  def max_mine
    errors.add(:num_of_mine, 'exceed over limit of cell on game board.') if num_of_mine > width * height
  end

  # Algorithms to generate minesweeper board
  def generate_board_data
    # init empty board first
    board = Array.new(height) { Array.new(width, 0) }

    num_of_mine.times do
      # random position of mine
      x = rand(height)
      y = rand(width)
      redo if board[x][y] == 'x'

      board[x][y] = 'x'

      # locate 8 points around the mine
      points_around = [
        [x - 1, y - 1], [x - 1, y], [x - 1, y + 1],
        [x, y - 1],                 [x, y + 1],
        [x + 1, y - 1], [x + 1, y], [x + 1, y + 1]
      ]
      # calculate value for each points around the mine
      points_around.each do |p_x, p_y|
        next unless p_x.between?(0, height - 1)
        next unless p_y.between?(0, width - 1)
        next if board[p_x][p_y] == 'x'

        board[p_x][p_y] += 1
      end
    end

    self.board_data = board
  end
end
