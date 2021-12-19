#!/usr/bin/env ruby

require 'set'

$nodes =
  open(__dir__ + '/input')
    .each_line
    .each_with_object({}) do |l, n|
      a, b = l.strip.split('-')
      n[a] ||= []
      n[a] << b
      n[b] ||= []
      n[b] << a
    end

$paths = []

def visit(name, path = [])
  # puts (" " * path.length) + name
  path += [name]
  if name == 'end'
    $paths << path
    return
  end
  occurrences =
    path.select { _1 !~ /[A-Z]/ }.group_by { _1 }.transform_values(&:count)
  limit = occurrences.values.any? { _1 == 2 } ? 1 : 2
  $nodes[name].each do
    next if _1 == 'start'
    next if occurrences[_1].to_i >= limit
    visit(_1, path)
  end
end

visit('start')
pp $paths.length
