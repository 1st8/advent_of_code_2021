#!/usr/bin/env ruby

result = 0
i = 0

open(__dir__ + '/input')
  .each_line
  .lazy
  .map(&:strip)
  .map(&:to_i)
  .reduce([Array.new(3), Array.new(3)]) do |acc, n|
    curr, prev = acc

    prev.shift
    prev << curr.last

    curr.shift
    curr << n

    i += 1

    next [curr, prev] if i < 4

    result += 1 if curr.sum > prev.sum

    [curr, prev]
  end

puts result
