#!/usr/bin/env ruby

$dots = []

def fold(matrix, index)
  top, bottom = matrix.partition.each_with_index { |_, i| i < index }
  top
    .zip(bottom.reverse)
    .map { |(r1, r2)| r1.zip(r2).map { |(v1, v2)| v1 + v2 } }
end

open(__dir__ + '/input').each_line do |l|
  if l =~ /^\d+,\d+$/
    x, y = l.strip.split(',').map(&:to_i)
    $dots[y] ||= []
    $dots[y][x] = 1
  elsif l =~ /^\n$/
    max_r = $dots.map { |r| r&.length.to_i }.max
    $dots.length.times do |y|
      max_r.times do |x|
        $dots[y] ||= []
        $dots[y][x] ||= 0
      end
    end
  elsif l =~ /^fold along y=(\d+)$/
    $dots = fold($dots, Regexp.last_match(1).to_i)
    break
  elsif l =~ /^fold along x=(\d+)$/
    $dots = fold($dots.transpose, Regexp.last_match(1).to_i).transpose
    break
  else
    raise "Invalid input line: #{l.inspect}"
  end
end

pp $dots.map { |r| r.count { |v| v > 0 } }.sum
