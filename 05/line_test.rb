require 'minitest/autorun'
require_relative 'screen'
require_relative 'line'

class TestLine < Minitest::Test
  def test_horizontal_points
    assert_equal [[1, 1], [2, 1], [3, 1]], Line.new([1, 1], [3, 1]).points
  end
  def test_horizontal_points2
    assert_equal [[3, 1], [2, 1], [1, 1]], Line.new([3, 1], [1, 1]).points
  end
  def test_vertical_points
    assert_equal [[1, 1], [1, 2], [1, 3]], Line.new([1, 1], [1, 3]).points
  end
  def test_vertical_points2
    assert_equal [[1, 3], [1, 2], [1, 1]], Line.new([1, 3], [1, 1]).points
  end
  def test_diagonal_points
    assert_equal [[1, 1], [2, 2], [3, 3]], Line.new([1, 1], [3, 3]).points
  end
  def test_diagonal_points2
    assert_equal [[3, 3], [2, 2], [1, 1]], Line.new([3, 3], [1, 1]).points
  end
end
