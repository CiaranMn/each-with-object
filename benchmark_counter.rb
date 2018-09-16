require_relative 'lib/counter.rb'
require 'benchmark'

Benchmark.bm(30) do |bm|

  fruit_basket = []
  100_000.times { fruit_basket.push("apple", "pear", "banana", "banana", "apple", "pear", "apple", "apple", "banana", "apple", "grape", "grape") }

  bm.report("each counter") do
    20.times { each_counter(fruit_basket) }
  end

  bm.report("each_with_object counter") do
    20.times { each_with_object_counter(fruit_basket) }
  end

  bm.report("inject counter") do
    20.times { inject_counter(fruit_basket) }
  end

  bm.report("inject with merge! counter") do
    20.times { inject_with_merge!(fruit_basket) }
  end

  equivalence_check = each_counter(fruit_basket) == each_with_object_counter(fruit_basket) && each_with_object_counter(fruit_basket) == inject_counter(fruit_basket) &&
  inject_counter(fruit_basket) == inject_with_merge!(fruit_basket)
  puts "Approaches return identical result? #{equivalence_check}"
end
