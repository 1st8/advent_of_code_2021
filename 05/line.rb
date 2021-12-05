class Line
  def self.all_from_input(input)
    input.each_line.map do |line|
      new(*line.strip.split(' -> ').map { _1.split(',').map(&:to_i) })
    end
  end

  attr_reader :p1, :p2

  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
  end

  def vertical?
    p1[0] == p2[0]
  end

  def horizontal?
    p1[1] == p2[1]
  end

  def diagonal?
    !vertical? && !horizontal?
  end

  def points
    if vertical?
      Range.new(*[p1[1], p2[1]].sort).map { |i| [p1[0], i] }
    elsif horizontal?
      Range.new(*[p1[0], p2[0]].sort).map { |i| [i, p1[1]] }
    elsif diagonal?
      []
    end
  end
end
