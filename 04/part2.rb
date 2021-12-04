#!/usr/bin/env ruby

require_relative 'board'

input = open(__dir__ + '/input')

draws = input.readline.strip.split(',').map(&:to_i)
input.readline

boards = []
boards << Board.from_input(input) until input.eof?

winners = []
draws.each do |draw|
  hits = 0
  boards.each do |board|
    next if winners.include?(board)

    hits += 1 if board.maybe_mark(draw)

    puts "draw #{draw} marked on #{hits} boards"
    winners << board if board.won?

    if winners.length == boards.length
      puts winners.last.value * draw
      exit
    end
  end
end
