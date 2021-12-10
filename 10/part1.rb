#!/usr/bin/env ruby

require_relative './parser'

VALUES = { ')' => 3, ']' => 57, '}' => 1197, '>' => 25_137 }

pp(
  open(__dir__ + '/input')
    .each_line
    .map do |l|
      begin
        Parser.new(l.strip).parse!
        0
      rescue ParseError => e
        VALUES[e.got]
      end
    end
    .sum
)
