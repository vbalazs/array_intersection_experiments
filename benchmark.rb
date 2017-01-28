require "benchmark"
require "benchmark/ips"
require_relative "intersections"
require_relative "gc_suite"

ARRAY_1 = Array.new(10_000) { rand(0...5_000) }
ARRAY_2 = Array.new(10_000) { rand(0...7_500) }

suite = GCSuite.new

Benchmark.ips do |x|
  x.config(suite: suite)

  # Hold results between multiple invocations of Ruby
  # x.hold! 'bm-tmp-results.txt'

  x.report("ruby stdlib") { ARRAY_1 & ARRAY_2 }
  x.report("naive") { Intersections.naive(ARRAY_1, ARRAY_2) }
  x.report("hash_storage") { Intersections.hash_storage(ARRAY_1, ARRAY_2) }
  x.report("double_elevators_with_sort") { Intersections.double_elevators_with_sort(ARRAY_1, ARRAY_2) }

  x.compare!
end
