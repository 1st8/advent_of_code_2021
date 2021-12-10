#!/usr/bin/env ruby

require_relative './parser'

VALUES = { ')' => 1, ']' => 2, '}' => 3, '>' => 4 }

pp(
  open(__dir__ + '/input')
    .each_line
    .map do |l|
      begin
        parser = Parser.new(l.strip).parse!
        parser
          .completion_sequence
          .reduce(0) { |result, token| (result * 5) + VALUES[token] }
      rescue ParseError
        nil
      end
    end
    .compact
    .sort
    .yield_self { |scores| scores[scores.length / 2] }
)
