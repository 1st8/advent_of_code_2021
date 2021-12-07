#!/usr/bin/env ruby

input = open(__dir__ + '/input').read.strip.split(',').map(&:to_i)

median = input.sort[input.length / 2]

pp input.sum { |n| (n - median).abs }
