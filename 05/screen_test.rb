require 'minitest/autorun'
require_relative 'screen'
require_relative 'line'

class TestBoard < Minitest::Test
  EXPECTED =
    '.......1..
..1....1..
..1....1..
.......1..
.112111211
..........
..........
..........
..........
222111....'

  EXPECTED_WITH_DIAGONALS =
    '1.1....11.
.111...2..
..2.1.111.
...1.2.2..
.112313211
...1.2....
..1...1...
.1.....1..
1.......1.
222111....'

  def test_screen_output_is_correct
    lines = Line.all_from_input(open(__dir__ + '/example')).reject(&:diagonal?)
    result = Screen.new(lines).output
    assert(result == EXPECTED, "expected:\n\n#{EXPECTED}\n\ngot:\n\n#{result}")
  end

  def test_screen_with_diagonals_output_is_correct
    lines = Line.all_from_input(open(__dir__ + '/example'))
    result = Screen.new(lines).output
    assert(
      result == EXPECTED_WITH_DIAGONALS,
      "expected:\n\n#{EXPECTED_WITH_DIAGONALS}\n\ngot:\n\n#{result}"
    )
  end
end
