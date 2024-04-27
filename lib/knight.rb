# frozen_string_literal: true

require_relative 'calculations'

# Defines a board that shows whether a position has been used already or not
class Knight
  include Calculations

  attr_accessor :board, :stack, :position, :results

  def initialize(position)
    # @board = Array.new(8).map { Array.new(8) }
    @position = position
    @stack = []
    @results = []
  end

  def find_path(target, initial = position) # rubocop: disable Metrics
    if array_equal?(stack.last, target)
      update_results(stack)
      return
    end

    # board[initial[0]][initial[1]] = true

    if stack.length < 7
      calc_possible(initial).each do |possible|
        stack.push(possible)
        find_path(target, possible) # if check_board(possible)
        stack.pop
      end
    end
  end

  def check_board(place)
    board[place[0]][place[1]].nil? ? true : false
  end

  def update_results(result)
    array = result.map { |path| path }
    results << array
  end

  def choose_shortest
    self.results = results.reduce(Array.new(7)) do |result, path|
      result = path if path.length < result.length
      result
    end
  end

  def pretty_print
    puts "You made it in #{results.length} moves!  Here's your path:"
    results.each { |array| puts "[#{array[0]},#{array[1]}]" }
  end

  def prove
    p calc_possible([5, 0])
  end
end

def knight_moves(initial, target)
  my_knight = Knight.new(initial)
  my_knight.find_path(target)
  my_knight.choose_shortest
  my_knight.pretty_print
end

knight_moves([0, 0], [5, 5])
