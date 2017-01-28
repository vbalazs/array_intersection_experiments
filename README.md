# Benchmarking array intersection algos

This repository just contains my experiments with different array intersection algorithms and their benchmarks.

There are two benchmarks in the repository:
- `benchmark.rb`: runs algorithms against unsorted arrays
- `benchmark_presorted.rb`: runs algorithms against pre-sorted arrays to see what is the difference if we know the input arrays are already sorted.

## Results

I ran the benchmarks on my [MacBook Pro](https://support.apple.com/kb/SP715?locale=en_US) (Retina, 13-inch, Early 2015, 2,7 GHz Intel Core i5).
Comparing two arrays both with ~10k random elements.

To replicate the results, do the followings:

```
$ gem install bundler
$ bundle install
$ ruby intersections_test.rb # make sure the tests pass
$ ruby benchmark.rb
```

### Unsorted arrays

```
Comparison:
         ruby stdlib:      434.7 i/s
double_elevators_with_sort:      213.1 i/s - 2.04x  slower
        hash_storage:      165.3 i/s - 2.63x  slower
               naive:        0.2 i/s - 2322.68x  slower
```

### Pre-sorted arrays

```
Comparison:
double_elevators_on_sorted:      530.2 i/s
         ruby stdlib:      491.3 i/s - 1.08x  slower
double_elevators_with_sort:      317.0 i/s - 1.67x  slower
        hash_storage:      184.8 i/s - 2.87x  slower
               naive:        0.2 i/s - 2884.84x  slower
```
