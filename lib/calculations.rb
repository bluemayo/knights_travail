# frozen_string_literal: true

# contains calculation methods needed
module Calculations
  def calc_possible(x_and_y) # rubocop:disable Metrics/MethodLength
    to = []
    x = x_and_y[0]
    y = x_and_y[1]
    x_array = calc_x_array(x)
    x_array.each do |x_number|
      diff = x < x_number ? 3 - x_number + x : 3 - x + x_number
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

  def array_equal?(x, y) # rubocop:disable Naming/MethodParameterName
    return false if x.nil?

    x[0] == y[0] && x[1] == y[1]
  end
end
