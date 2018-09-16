fruit_basket = %w[apple pear banana banana apple pear apple apple banana apple grape grape]


def each_counter(arr)
  counter = Hash.new(0)
  arr.each do |item|
    counter[item] += 1
  end
  counter
end

def each_with_object_counter(arr)
  arr.each_with_object(Hash.new(0)) do |item, counter|
    counter[item] += 1
  end
end

def inject_counter(arr)
  arr.inject(Hash.new(0)) do |counter, item|
    counter[item] += 1
    counter
  end
end

def inject_with_merge!(arr)
  arr.inject(Hash.new(0)) do |counter, item|
    counter.merge!(item => counter[item]+=1)
  end
end
