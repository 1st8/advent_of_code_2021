#!/usr/bin/env ruby

GREEN = "\033[0;32m"
NC = "\033[0m"

def around(x, y)
  [[x, y - 1], [x - 1, y], [x + 1, y], [x, y + 1]]
end

def values_around(lines, x, y)
  around(x, y).map { |(x, y)| lines[y][x] }
end

def expand(lines, x, y, basin = [])
  basin << [x, y]

  around(x, y)
    .reduce(basin) do |basin, (xa, ya)|
      next basin if basin.include?([xa, ya])

      if (lines[ya][xa] > lines[y][x] && lines[ya][xa] < 9)
        expand(lines, xa, ya, basin)
      else
        basin
      end
    end

  basin
end

lines =
  open(__dir__ + '/input')
    .readlines
    .map { |l| [9] + l.strip.chars.map(&:to_i) + [9] }

low_points = []

lines.unshift(Array.new(lines.first.length, 9))
lines << Array.new(lines.first.length, 9)

lines.each_with_index do |line, y|
  next if y == 0 || y == lines.length - 1

  line.each_with_index do |height, x|
    next if x == 0 || x == line.length - 1

    low_points << [x, y] if values_around(lines, x, y).all? { |a| a > height }
  end
end

basins = low_points.map { |(x, y)| expand(lines, x, y) }
pp basins.sort_by(&:length).last(3).map(&:length).reduce(&:*)
