class Triangle
  # write code here
  attr_accessor :first_input, :second_input, :third_input

    def initialize(first_input, second_input, third_input)
      @first_input = first_input
      @second_input = second_input
      @third_input = third_input

    end

    def kind
      validate_triangle
      if first_input == second_input && second_input == third_input
        :equilateral
      elsif first_input == second_input || second_input == third_input || first_input == third_input
        :isosceles
      else
        :scalene
      end
    end

    def sides_greater_than_zero?
      [first_input, second_input, third_input].all?(&:positive?)
    end

    def valid_triangle_inequality?
      first_input + second_input > third_input && first_input + third_input > second_input && second_input + third_input > first_input
    end

    def validate_triangle
      raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
    end

    class TriangleError < StandardError
    end
end
