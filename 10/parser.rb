class ParseError < Exception
  attr_reader :expected, :got

  def initialize(expected, got)
    @expected = expected
    @got = got
  end
end

class Parser
  PAIRS = { '{' => '}', '[' => ']', '(' => ')', '<' => '>' }

  def initialize(line)
    @line = line
    @tokens = []
  end

  def parse!
    @line.each_char do |token|
      if PAIRS.key?(token)
        @tokens << token
      else
        expected = PAIRS[@tokens.pop]
        raise ParseError.new(expected, token) if token != expected
      end
    end
    @incomplete = true if @tokens.length > 0
    self
  end

  def completion_sequence
    @tokens.reverse_each.map { PAIRS[_1] }
  end
end
