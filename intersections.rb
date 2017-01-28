require 'set'

module Intersections

  def naive(array_1, array_2)
    result = Set.new
    array_1.each do |item|
      array_2.each do |item_2|
        result << item if item == item_2
      end
    end

    result.to_a
  end

  def double_elevators_with_sort(array_1, array_2)
    result = Set.new

    sorted_1 = array_1.sort
    sorted_2 = array_2.sort
    i = 0
    j = 0

    while i < sorted_1.size && j < sorted_2.size
      item_1 = sorted_1[i]
      item_2 = sorted_2[j]

      if item_1 < item_2
        i += 1
      elsif item_1 > item_2
        j += 1
      else
        result << item_1
        i += 1
        j += 1
      end
    end

    result.to_a
  end

  def double_elevators_on_sorted(array_1, array_2)
    result = Set.new

    i = 0
    j = 0

    while i < array_1.size && j < array_2.size
      item_1 = array_1[i]
      item_2 = array_2[j]

      if item_1 < item_2
        i += 1
      elsif item_1 > item_2
        j += 1
      else
        result << item_1
        i += 1
        j += 1
      end
    end

    result.to_a
  end

  def hash_storage(array_1, array_2)
    storage = {}

    array_1.each { |item| storage[item] = storage[item] ? storage[item] += 1 : 0 }
    array_2.each { |item| storage[item] = storage[item] ? storage[item] += 1 : 0 }

    storage.keep_if { |key, value| value > 0 }.keys
  end

  module_function :naive,
                  :double_elevators_with_sort,
                  :double_elevators_on_sorted,
                  :hash_storage
end
