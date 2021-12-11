#!/usr/bin/env ruby

require_relative './octopus'

def adjacent(octopuses, x, y)
  [
    octopuses[y - 1][x - 1],
    octopuses[y - 1][x],
    octopuses[y - 1][x + 1],
    octopuses[y][x - 1],
    octopuses[y][x + 1],
    octopuses[y + 1][x - 1],
    octopuses[y + 1][x],
    octopuses[y + 1][x + 1]
  ].compact
end

octopuses =
  open(__dir__ + '/input')
    .each_line
    .map { |l| [nil] + l.strip.chars.map { Octopus.new(_1.to_i) } + [nil] }

octopuses.unshift(Array.new(octopuses.first.length))
octopuses << Array.new(octopuses.first.length)
octopuses.each_with_index do |l, y|
  l.each_with_index { |o, x| o&.adjacent = adjacent(octopuses, x, y) }
end

octopuses = octopuses.flatten.compact

pp(
  100
    .times
    .map do
      octopuses.each(&:increment_energy)
      while octopuses.any?(&:maybe_flash)
      end

      # octopuses.compact.each do |l|
      #   l.compact.each { |o| print('%3d' % o&.energy) }
      #   puts
      # end
      # octopuses.compact.each { _1.compact.each(&:maybe_flash) }
      result = octopuses.count(&:flashed)
      octopuses.each(&:maybe_reset)
      result
    end
    .sum
)
