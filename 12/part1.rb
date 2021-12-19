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
  path += [name]
  if name == 'end'
    $paths << path
    return
  end
  $nodes[name].each do
    next if path.include?(_1) && _1 !~ /[A-Z]/
    visit(_1, path)
  end
end

visit('start')
pp $paths.length
