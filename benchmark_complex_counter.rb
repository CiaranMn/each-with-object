require_relative 'lib/complex_counter.rb'
require 'benchmark'

Benchmark.bm(30) do |bm|

  shopping_baskets = { }
  100_000.times do |i|
    basket = "basket#{i}"
    shopping_baskets[basket] = {
      apple: { quantity: 3, price: 1 },
      banana: { quantity: 5, price: 2 },
      strawberry: { quantity: 1, price: 4 },
      pear: { quantity: 4, price: 2 },
      grape: { quantity: 1, price: 3 },
      melon: { quantity: 1, price: 3 }
    }
  end

  bm.report("each complex counter") do
    50.times { each_complex_counter(shopping_baskets) }
  end

  bm.report("each_with_object complex counter") do
    50.times { each_with_object_complex_counter(shopping_baskets) }
  end

  equivalence_check = each_complex_counter(shopping_baskets) == each_with_object_complex_counter(shopping_baskets)

  puts "Approaches return identical results? #{equivalence_check}"

end
