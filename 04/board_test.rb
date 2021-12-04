require 'minitest/autorun'
require_relative 'board'

class TestBoard < Minitest::Test
  def setup
    @board = Board.new([[1, 2], [3, 4]])
  end

  def test_row_wins
    @board.maybe_mark(1)
    @board.maybe_mark(2)
    assert @board.won?
  end

  def test_col_wins
    @board.maybe_mark(1)
    @board.maybe_mark(3)
    assert @board.won?
  end
end
