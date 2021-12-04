#!/usr/bin/env ruby

lines = open(__dir__ + '/input').each_line.map { |l| l.strip! }

def search(lines, search_most_common)
  last_matched = nil
  lines.first.length.times do |pos|
    ones = lines.count { |l| l[pos] == '1' }
    zeroes = lines.count - ones
    search = ones >= zeroes ? '1' : '0'
    lines.select! do |l|
      if search_most_common ? l[pos] == search : l[pos] != search
        last_matched = l
      end
    end
  end
  last_matched
end

oxygen_generator_rating = search(lines.dup, true)

pp oxygen_generator_rating

co2_scrubber_rating = search(lines.dup, false)

pp co2_scrubber_rating

pp oxygen_generator_rating.to_i(2) * co2_scrubber_rating.to_i(2)
