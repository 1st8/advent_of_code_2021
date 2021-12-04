#!/usr/bin/env ruby

counts = nil
total = 0

open(__dir__ + '/input').each_line do |l|
  total += 1
  l.strip!
  counts ||= l.length.times.map { 0 }
  l.chars.each_with_index { |char, i| counts[i] += 1 if char == '1' }
end

gamma = counts.map { |c| c >= total / 2 ? '1' : '0' }.join.to_i(2)
epsilon = counts.map { |c| c < total / 2 ? '1' : '0' }.join.to_i(2)
pp gamma * epsilon
