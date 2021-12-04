require_relative 'cell'

class Board
  def self.from_input(input)
    values = 5.times.map { input.readline.strip.split(/\s+/).map(&:to_i) }.to_a
    input.readline unless input.eof?
    new(values)
  end

  def initialize(values)
    @rows = values.map { |row| row.map { Cell.new(_1) } }
  end

  def maybe_mark(value)
    @rows.each do |row|
      row.each do |cell|
        if cell.value == value
          cell.mark!
          return true
        end
      end
    end
    false
  end

  def won?
    @rows.any? { |row| row.all?(&:marked) } ||
      @rows.transpose.any? { |col| col.all?(&:marked) }
  end

  def value
    @rows.flat_map { |row| row.reject(&:marked).map(&:value) }.sum
  end
end
