#!/usr/bin/env ruby

depth = 0
h = 0

open(__dir__ + '/input').each_line do |l|
  command, value = l.strip.split(' ')
  case command
  when 'forward'
    h += value.to_i
  when 'down'
    depth += value.to_i
  when 'up'
    depth -= value.to_i
  end
end

puts depth * h
