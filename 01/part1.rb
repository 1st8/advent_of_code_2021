#!/usr/bin/env ruby

s = 0

open(__dir__ + '/input')
  .each_line
  .lazy
  .map(&:strip)
  .map(&:to_i)
  .reduce do |l, i|
    s += 1 if i > l
    i
  end

puts s
