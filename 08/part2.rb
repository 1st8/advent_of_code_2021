#!/usr/bin/env ruby
require 'set'

input =
  open(__dir__ + '/input')
    .each_line
    .lazy
    .map do |l|
      l.split(' | ').map { |s| s.split(' ').map { Set.new(_1.chars) } }
    end

result =
  input.map do |(observations, outputs)|
    d = {}
    remaining =
      observations.filter_map do |i|
        found =
          case i.length
          when 2
            d[1] = i
          when 3
            d[7] = i
          when 4
            d[4] = i
          when 7
            d[8] = i
          else
            false
          end
        found ? false : i
      end
    d[:h_top] = d[7] - d[1]
    d[9] = remaining.find { |i| i.proper_superset?(d[4] + d[7]) }
    remaining -= [d[9]]
    d[:h_bot] = d[9] - d[4] - d[:h_top]
    d[:v_bot_left] = d[8] - d[9]
    d[2] =
      remaining.find do |i|
        i.size == 5 &&
          i.proper_superset?(d[:v_bot_left] + d[:h_bot] + d[:h_top])
      end
    d[6] =
      remaining.find do |i|
        i.size == 6 &&
          i.proper_superset?(d[:v_bot_left] + d[:h_bot] + d[:h_top]) &&
          !i.proper_superset?(d[7])
      end
    remaining -= [d[2], d[6]]
    d[:v_bot_right] = d[6] & d[1]
    d[:v_top_right] = d[2] & d[1]
    d[:v_top_left] = d[6] - d[2] - d[:v_bot_right]
    d[3] = remaining.find { |i| i.size == 5 && i.proper_superset?(d[7]) }
    d[0] = remaining.find { |i| i.size == 6 && i.proper_superset?(d[7]) }
    d[5] = d[9] - d[:v_top_right]

    outputs.map { |out| (0..9).find { |i| d[i] == out }.to_s }.join.to_i(10)
  end.sum

pp result
