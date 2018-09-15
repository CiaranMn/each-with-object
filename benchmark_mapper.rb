require_relative 'lib/mapper.rb'
require 'benchmark'

Benchmark.bm(30) do |bm|

  fruit_basket = []
  50_000.times { fruit_basket.push("apple", "pear", "banana", "banana", "apple", "pear", "apple", "apple", "banana", "apple", "grape", "grape") }

  bm.report("#map approach") do
    100.times { map_approach(fruit_basket) }
  end

  bm.report("short #map approach") do
    100.times { short_map_approach(fruit_basket) }
  end

  bm.report("#each mapper") do
    100.times { each_approach(fruit_basket) }
  end

  bm.report("#each_with_object mapper") do
    100.times { each_with_object_mapper(fruit_basket) }
  end

  equivalence_check =
    (map_approach(fruit_basket) == each_with_object_mapper(fruit_basket)) &&
    (each_with_object_mapper(fruit_basket) == each_approach(fruit_basket)) &&
    (each_approach(fruit_basket) == short_map_approach(fruit_basket))
  puts "Approaches return identical result? #{equivalence_check}"

end
