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

def each_complex_counter(hash)
  counter = Hash.new(0)
  hash.each do |basket, contents|
    contents.each do |fruit, details|
      counter[fruit] += details[:price]
    end
  end
  counter
end

def each_with_object_complex_counter(hash)
  hash.each_with_object(Hash.new(0)) do |(basket, contents), counter|
    contents.each do |fruit, details|
      counter[fruit] += details[:price]
    end
  end
end
