fruit_basket = %w[apple pear banana banana apple pear apple apple banana apple grape grape]

def each_approach(array)
  results = []
  array.each { |item| results << item.length }
  results
end

def each_with_object_mapper(array)
  array.each_with_object([]) { |item, results| results << item.length }
end

def map_approach(array)
  array.map { |item| item.length }
end

def short_map_approach(array)
  array.map(&:length)
end
