# frozen_string_literal: true

require_relative 'board'
# defines the position of a knight and where it can move
class Knight
  attr_accessor :at, :possible, :board

  def initialize(at)
    @at = at
    @possible = calc_possible(at[0], at[1])
    p possible
    @board = Array.new(8).map { Array.new(8) }
    board[at[0]][at[1]] = 'knight'
    p board
  end

  private

  def calc_possible(x, y) # rubocop:disable Naming/MethodParameterName
    to = []
    x_array = calc_x_array(x)
    x_array.each do |x_number|
      diff = x < x_number ? 3 - x_number - x : 3 - x - x_number
      y_array = calc_y_array(y, diff)
      y_array.each do |y_number|
        to << [x_number, y_number]
      end
    end
    to
  end

  def calc_x_array(x) # rubocop:disable Naming/MethodParameterName
    array = (x - 2..x + 2).to_a
    array.delete_at(2)
    array.reject { |position| position.negative? || position > 7 }
  end

  def calc_y_array(y, diff) # rubocop:disable Naming/MethodParameterName
    array = Array.new(2, y)
    array[0] -= diff
    array[1] += diff
    array.reject { |position| position.negative? || position > 7 }
  end
end

Knight.new([0, 0])
