#!/usr/bin/env ruby

input = open(__dir__ + '/input').read.strip.split(',').map(&:to_i)

counts = Array.new(9, 0)

input.each { |i| counts[i] += 1 }

80.times do |i|
  next_gen = counts.shift
  counts[6] += next_gen
  counts[8] = next_gen
end

pp counts.sum
