class Screen
  def initialize(lines)
    @lines = lines
    @width = lines.flat_map { |l| [l.p1[0], l.p2[0]] }.max + 1
    @height = lines.flat_map { |l| [l.p1[1], l.p2[1]] }.max + 1
  end

  def counts
    counts = @height.times.map { @width.times.map { 0 } }
    @lines.each { |line| line.points.each { |(x, y)| counts[y][x] += 1 } }
    counts
  end

  def output
    counts
      .map { |row| row.map { |count| count == 0 ? '.' : count }.join }
      .join("\n")
  end
end
