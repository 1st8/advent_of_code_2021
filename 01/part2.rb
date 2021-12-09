#!/usr/bin/env ruby

pp(
  open(__dir__ + '/input')
    .each_line
    .lazy
    .map(&:strip)
    .map(&:to_i)
    .each_cons(3)
    .map(&:sum)
    .each_cons(2)
    .count { |prev, curr| curr > prev }
)
