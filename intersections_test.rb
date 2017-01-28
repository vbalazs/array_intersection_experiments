require "minitest/autorun"
require "minitest/pride"
require_relative "intersections"

class IntersectionsTest < Minitest::Test
  def test_empty_arrays
    array_1 = []
    array_2 = []

    assert_equal [], Intersections.naive(array_1, array_2)
    assert_equal [], Intersections.double_elevators_with_sort(array_1, array_2)
    assert_equal [], Intersections.double_elevators_on_sorted(array_1, array_2)
    assert_equal [], Intersections.hash_storage(array_1, array_2)
  end

  def test_one_empty_array
    array_1 = []
    array_2 = [1, 2, 3]

    assert_equal [], Intersections.naive(array_1, array_2)
    assert_equal [], Intersections.double_elevators_with_sort(array_1, array_2)
    assert_equal [], Intersections.double_elevators_on_sorted(array_1, array_2)
    assert_equal [], Intersections.hash_storage(array_1, array_2)
  end

  def test_returns_empty_array_on_different_items
    array_1 = [1, 2, 3]
    array_2 = [4, 5, 6]

    assert_equal [], Intersections.naive(array_1, array_2)
    assert_equal [], Intersections.double_elevators_with_sort(array_1, array_2)
    assert_equal [], Intersections.double_elevators_on_sorted(array_1, array_2)
    assert_equal [], Intersections.hash_storage(array_1, array_2)
  end

  def test_returns_common_items_when_unsorted
    array_1 = [4, 3, 2, 1]
    array_2 = [6, 4, 2]

    assert_equal [4, 2], Intersections.naive(array_1, array_2)
    assert_equal [2, 4], Intersections.double_elevators_with_sort(array_1, array_2)
    assert_equal [4, 2], Intersections.hash_storage(array_1, array_2)
  end

  def test_returns_common_items_when_sorted
    array_1 = [1, 2, 3, 4]
    array_2 = [2, 4, 6]

    assert_equal [2, 4], Intersections.naive(array_1, array_2)
    assert_equal [2, 4], Intersections.double_elevators_with_sort(array_1, array_2)
    assert_equal [2, 4], Intersections.double_elevators_on_sorted(array_1, array_2)
    assert_equal [2, 4], Intersections.hash_storage(array_1, array_2)
  end

  def test_duplicated_elements
    array_1 = [2, 4, 6]
    array_2 = [1, 2, 2, 3]

    assert_equal [2], Intersections.naive(array_1, array_2)
    assert_equal [2], Intersections.double_elevators_with_sort(array_1, array_2)
    assert_equal [2], Intersections.double_elevators_on_sorted(array_1, array_2)
    assert_equal [2], Intersections.hash_storage(array_1, array_2)
  end
end
