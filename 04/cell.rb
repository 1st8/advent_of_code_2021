class Cell
  RED = "\033[0;31m"
  GREEN = "\033[0;32m"
  NC = "\033[0m"

  attr_reader :value, :marked

  def initialize(value)
    @value = value
    @marked = false
  end

  def mark!
    @marked = true
  end

  def inspect
    [@marked ? GREEN : RED, @value.to_s, NC].join
  end
end
