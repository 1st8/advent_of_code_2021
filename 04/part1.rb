#!/usr/bin/env ruby

require_relative 'board'

input = open(__dir__ + '/input')

draws = input.readline.strip.split(',').map(&:to_i)
input.readline

boards = []
boards << Board.from_input(input) until input.eof?

draws.each do |draw|
  hits = 0
  boards.each do |board|
    hits += 1 if board.maybe_mark(draw)

    if board.won?
      puts board.value * draw
      exit
    end
  end

  puts "draw #{draw} marked on #{hits} boards"
end
