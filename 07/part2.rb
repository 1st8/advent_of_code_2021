#!/usr/bin/env ruby
require 'benchmark'

input = open(__dir__ + '/input').read.strip.split(',').map(&:to_i)

def fuel(steps)
  (steps * (steps + 1)) / 2
end

Benchmark.bmbm do |x|
  # Brute force
  x.report('brute force') do
    fuel_usages = input.uniq.map { |pos| input.sum { |n| fuel((n - pos).abs) } }
    pp fuel_usages.min
  end

  # Smart
  # https://www.reddit.com/r/adventofcode/comments/rav728/comment/hnkvnzr/?utm_source=reddit&utm_medium=web2x&context=3
  x.report('smart') do
    mean = input.sum.to_f / input.length
    num_crabs = input.length.to_f
    num_values_smaller_than_mean = input.count { |i| i < mean }.to_f
    correction =
      (num_crabs - 2 * (num_values_smaller_than_mean)) / (2 * num_crabs)

    target = (mean + correction).round

    pp input.sum { |i| fuel((target - i).abs) }
  end
end
