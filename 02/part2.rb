#!/usr/bin/env ruby

depth = 0
h = 0
aim = 0

open(__dir__ + '/input').each_line do |l|
  command, value = l.strip.split(' ')
  value = value.to_i
  case command
  when 'forward'
    h += value
    depth += aim * value
  when 'down'
    aim += value
  when 'up'
    aim -= value
  end
end

puts depth * h
