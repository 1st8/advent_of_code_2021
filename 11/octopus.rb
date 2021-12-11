class Octopus
  attr_reader :energy, :flashed
  attr_accessor :adjacent

  def initialize(energy)
    @energy = energy
    @flashed = false
    @adjacent = []
  end

  def increment_energy
    @energy += 1
  end

  def maybe_flash
    if @energy > 9 && !@flashed
      flash!
      true
    else
      false
    end
  end

  def flash!
    @flashed = true
    @adjacent.each { |octopus| octopus.increment_energy }
  end

  def maybe_reset
    if @flashed
      @flashed = false
      @energy = 0
    end
  end

  def inspect
    "O(#{@energy})"
  end
end
