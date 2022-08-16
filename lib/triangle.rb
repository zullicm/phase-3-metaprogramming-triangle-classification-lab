require "pry"
class Triangle
  attr_accessor :side_one, :side_two, :side_three


  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def kind
    all_sides = []
    all_sides << @side_one
    all_sides << @side_two
    all_sides << @side_three

    neg_check = all_sides.filter { |num| num.negative? }


    if all_sides.sum < 1
      raise TriangleError
    elsif neg_check.length > 0
      raise TriangleError
    elsif all_sides[0] + all_sides[1] <= all_sides[2] || all_sides[2] + all_sides[1] <= all_sides[0] || all_sides[0] + all_sides[2] <= all_sides[1]
      raise TriangleError
    elsif all_sides.uniq.length == 1
      :equilateral
    elsif all_sides.uniq.length == 2
      :isosceles
    elsif all_sides.uniq.length == 3
      :scalene
    end
  end

  class TriangleError < StandardError
  end

end
