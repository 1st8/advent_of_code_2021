require 'matrix'

class Line
  def self.all_from_input(input)
    input.each_line.map do |line|
      new(*line.strip.split(' -> ').map { _1.split(',').map(&:to_i) })
    end
  end

  attr_reader :root, :vector

  def initialize(p1, p2)
    @root = Vector[*p1]
    @vector = Vector[p2[0] - p1[0], p2[1] - p1[1]]
  end

  def p1
    @root
  end
  def p2
    @root + @vector
  end

  def vertical?
    @vector.angle_with(Vector[0, 1]) == 0 ||
      @vector.angle_with(Vector[0, -1]) == 0
  end

  def horizontal?
    @vector.angle_with(Vector[1, 0]) == 0 ||
      @vector.angle_with(Vector[-1, 0]) == 0
  end

  def diagonal?
    !vertical? && !horizontal?
  end

  def points
    normalized = @vector / @vector.to_a.map(&:abs).max
    points = [p1.to_a]
    current = p1
    while current != p2
      current += normalized
      points << current.to_a
    end
    points
  end
end
