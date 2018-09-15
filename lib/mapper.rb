fruit_basket = %w[
  apple
  pear
  banana
  banana
  apple
  pear
  apple
  apple
  banana
  apple
  grape
  grape
]

def map_approach(array)
  array.map do |item|
    item.length
  end
end

def short_map_approach(array)
  array.map(&:length)
end

def each_approach(array)
  results = []
  array.each do |item|
    results << item.length
  end
  results
end

def each_with_object_mapper(array)
  array.each_with_object([]) do |item, results|
    results << item.length
  end
end
