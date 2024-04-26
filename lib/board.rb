# frozen_string_literal: true

require_relative 'knight'

# Defines a board that shows whether a position has been used already or not
class Board
  attr_accessor :board, :root

  def initialize(position)
    @board = Array.new(8).map { Array.new(8) }
    @root = Knight.new(position)
    board[position[0]][position[1]] = true
    build_board(root.possible)
  end

  private

  def build_board(array_of_next)
    array_of_next.each do |array|
      board[array[0]][array[1]] = true
    end
  end
end

p Board.new([0, 0]).board
