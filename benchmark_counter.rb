require_relative 'lib/counter.rb'
require 'benchmark'

Benchmark.bm(30) do |bm|

  fruit_basket = []
  50_000.times { fruit_basket.push("apple", "pear", "banana", "banana", "apple", "pear", "apple", "apple", "banana", "apple", "grape", "grape") }

  bm.report("each with separate hash counter") do
    100.times { each_counter(fruit_basket) }
  end

  bm.report("each_with_object counter") do
    100.times { each_with_object_counter(fruit_basket) }
  end

  bm.report("inject and return counter") do
    100.times { inject_and_return(fruit_basket) }
  end

  equivalence_check = each_counter(fruit_basket) == each_with_object_counter(fruit_basket) && each_with_object_counter(fruit_basket) == inject_and_return(fruit_basket)
  puts "Approaches return identical result? #{equivalence_check}"
end
