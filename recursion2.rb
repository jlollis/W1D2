# Recursion 2

# Write a recursive method, range, that takes a start and an end and returns an array 
# of all numbers in that range, exclusive. For example, range(1, 5) should return 
# [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(min, max)
  return [] if max == min  # base case is an array (so our function returns an array)
  [min] + range(min + 1, max)
end

p range(1, 5) # [1, 2, 3, 4]

# Write both a recursive and iterative version of sum of an array.

def sum_array_recursive(arr)
  # base case
  if arr.empty?
    0 
  else # recursive call
    arr.pop + sum_array_recursive(arr)
  end
end
p sum_array_recursive([4,3,2,7,9])  # 25

def sum_array_iterative(arr)
  arr.inject(:+)
end

p sum_array_iterative([4,3,2,7,9])  # 25

# Exponentiation
# Math Examples:
# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

# recursion 1 
def exponent_recursion1(n, exp)
  if exp == 0
    1
  else
    return n * exponent_recursion1(n, exp - 1)
  end
end

puts "Exponent Recursion 1: \n"
n = 3
exp = 4
p exponent_recursion1(n, exp) # 81

# recursion 2 
def exponent_recursion2(n, exp)
  if exp == 0
    1
  elsif exp % 2 == 0
    exponent_recursion2(n, exp / 2) ** 2
  else
    n * exponent_recursion2(n, (exp - 1) / 2) ** 2
  end
end

puts "Exponent Recursion 2: \n"
p exponent_recursion2(n, exp) # 81

# Deep dup
# Using recursion and the is_a? method, write an Array#deep_dup method 
# that will perform a "deep" duplication of the interior arrays.

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

# how to do deep copy with Ruby using recursion
def deep_dup(arr)
  Marshal.load( Marshal.dump(arr) )
end

puts "Deep dup: \n"
p deep_dup(robot_parts)   # [["nuts", "bolts", "washers"], ["capacitors", "resistors", "inductors"]]

# Fibonacci
# Write a recursive and an iterative Fibonacci method. 
# The method should take in an integer n and return the first n Fibonacci numbers in an array.

def fib_rec(n)
  n < 2 ? n : fib_rec(n-1) + fib_rec(n-2)
end

puts "Fibonacci, Recursive: \n"
p fib_rec(9)    # 34
p fib_rec(11)   # 89

def fib_iter(n)
  a = 0
  b = 1

  n.times do 
    c = a
    a = b
    b = c + b
  end
  return a
end

puts "Fibonacci, Iterative: \n"
p fib_iter(9)   # 34
p fib_iter(11)  # 89

# Binary Search
# Write a recursive binary search: bsearch(array, target). 

def bsearch(array, target)
  return nil if array.empty?

  half = array.length / 2
  
  case target <=> array[half] 
    when -1  # left search
      bsearch(array.take(half), target)
    when  0  # hits target
      half
    when  1  # right search
      is_high = bsearch(array.drop(half + 1), target)
      is_high.nil? ? nil : (half + 1) + is_high 
    end
end

puts "Recursive Binary Search: \n"

p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# Merge Sort
# Implement a method merge_sort that sorts an Array.

# You need to have merge available before you can do merge sort.

def merge(a, b) # merge takes in arrays a and b as parameters
  idx_a = 0
  idx_b = 0

  new_arr = []

  while idx_a < a.length && idx_b < b.length do
    if a[idx_a] <= b[idx_b] then
      new_arr << a[idx_a]
      idx_a += 1
    else
      new_arr << b[idx_b]
      idx_b += 1
    end
  end
  if (idx_a < a.length) then
    for i in (idx_a..a.length-1) do
      new_arr << a[i]
    end
  else
    for i in (idx_b..b.length-1) do
      new_arr << b[i]
    end
  end
  return new_arr
end

p merge([1, 2, 3, 4, 5, 7], [3, 5, 6, 9, 11, 15, 18]) 
# => [1, 2, 3, 3, 4, 5, 5, 6, 7, 9, 11, 15, 18]

def merge_sort(array)
  return array if array.length == 1 
  midpoint = array.length/2
  a = array[0..midpoint-1]
  b = array[midpoint..array.length-1]
  new_a = merge_sort(a) 
  new_b = merge_sort(b) 
  new_arr = merge(new_a, new_b)
  return new_arr
end

puts "Merge Sort: \n"
p merge_sort([5,2,6,77,13,5,2,61,6,1,6777,1]) 
# => [1, 1, 2, 2, 5, 5, 6, 6, 13, 61, 77, 6777]

# Array Subsets

# Write a method subsets that will return all subsets of an array.

def subsets(array)
  if array.empty?
    [[]]
  else
    a, *b = array
    new_arr = []
    subsets(b).each do |subset|
      new_arr.push(subset)
      new_arr.push(subset.clone.push(a))
    end
    new_arr
  end
end

def sum_to_zero?(array)
  array.reduce(0, :+) == 0
end

def subsets_sum_to_zero(array)
  subsets(array).select { |subset| sum_to_zero?(subset)}
end

puts "Array Subsets: \n"
p subsets([]) # => [[]]
p subsets([1]) # => [[], [1]]
p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. 

def permutations(array)
  return [array] if array.length <= 1

  a = array.shift # remove el at index 0, store as a
  perms = permutations(array)
  total_perms = []

  perms.each do |perm|
    (0..perm.length).each do |i|
      total_perms << perm[0...i] + [a] + perm[i..-1]
    end
  end
  total_perms
end

puts "Permutations: \n"
p permutations([1, 2, 3])   # [[1, 2, 3], [2, 1, 3], [2, 3, 1], [1, 3, 2], [3, 1, 2], [3, 2, 1]]

# And here is Ruby's built in Array#permutation method: 
# [1, 2, 3].permutation.to_a
# => [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]