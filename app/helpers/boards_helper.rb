module BoardsHelper
  def cell_numeric(number)
    colors = %w[blue green red orange purple]
    return 'black' unless number.between?(1, colors.size)

    colors[number - 1]
  end
end
