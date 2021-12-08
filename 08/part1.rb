#!/usr/bin/env ruby

lengths = [2, 3, 4, 7]

input =
  open(__dir__ + '/input')
    .each_line
    .lazy
    .map { |l| l.split(' | ').map { |s| s.split(' ') } }

pp input.sum { |(_, out)| out.select { |o| lengths.include?(o.length) }.count }
