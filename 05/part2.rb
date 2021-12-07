#!/usr/bin/env ruby

require_relative 'screen'
require_relative 'line'

screen = Screen.new(Line.all_from_input(open(__dir__ + '/input')))

result = screen.counts.map { |row| row.count { |c| c >= 2 } }.sum

puts result
