#!/usr/bin/env ruby

GREEN = "\033[0;32m"
NC = "\033[0m"

lines =
  open(__dir__ + '/input')
    .readlines
    .map { |l| [9] + l.strip.chars.map(&:to_i) + [9] }

risk_levels = []

lines.unshift(Array.new(lines.first.length, 9))
lines << Array.new(lines.first.length, 9)

lines.each_with_index do |line, y|
  next if y == 0 || y == lines.length - 1

  line.each_with_index do |height, x|
    next if x == 0 || x == line.length - 1

    around = [
      lines[y - 1][x],
      lines[y][x - 1],
      lines[y][x + 1],
      lines[y + 1][x]
    ]
    low_point = around.all? { |a| a > height }
    print low_point ? [GREEN, height, NC].join : height
    risk_levels << height + 1 if low_point
  end
  puts
end

puts risk_levels.sum
