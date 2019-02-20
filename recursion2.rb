# Warmup

# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(min, max)
  return [] if max == min  # base case is array
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

def sum_array_iterative(arr)
  arr.inject(:+)
end

p sum_array_recursive([4,3,2,7,9])

arr = [4,3,2,7,9]

p sum_array_iterative(arr)

# Exponentiation

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

# recursion 2 

def exponent_recursion2(n, exp)
  if exp == 0
    1
  elsif exp == 1
    n
  elsif n % 2 == 0
    exponent_recursion2(n, exp / 2) ** 2
  else
    n * exponent_recursion2(n, (exp - 1) / 2) ** 2
  end
end

n = 3
exp = 4
p exponent_recursion1(n, exp) 
p exponent_recursion2(n, exp) # seems to be cutting off, or there is an error, maybe it can't handle an exponent higher than 3 with this type of recursion, or there is an error

# Deep dup

# Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

def deep_dup(arr)
  Marshal.load( Marshal.dump(arr) )
end

p deep_dup(robot_parts)   # [["nuts", "bolts", "washers"], ["capacitors", "resistors", "inductors"]]

# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

def fib_rec(n)
  n < 2 ? n : fib_rec(n-1) + fib_rec(n-2)
end

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

p fib_rec(9)    # 34
p fib_iter(9)   # 34

p fib_rec(11)   #89
p fib_iter(11)  #89

# Binary Search
# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

def bsearch(array, target)

end

# Make sure that these test cases are working:

bsearch([1, 2, 3], 1) # => 0
bsearch([2, 3, 4, 5], 3) # => 1
bsearch([2, 4, 6, 8, 10], 6) # => 2
bsearch([1, 3, 4, 5, 9], 5) # => 3
bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
bsearch([1, 2, 3, 4, 5, 7], 6) # => nil



# # Merge Sort
# # Implement a method merge_sort that sorts an Array:

# # The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# # You'll want to write a merge helper method to merge the sorted halves.
# # To get a visual idea of how merge sort works, watch this gif and check out this diagram.

def merge_sort

end 


# Array Subsets
# Write a method subsets that will return all subsets of an array.

def subsets(arr)

end

subsets([]) # => [[]]
subsets([1]) # => [[], [1]]
subsets([1, 2]) # => [[], [1], [2], [1, 2]]
subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.

# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

def permutations(array)

end

permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

[1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
                            #     [2, 1, 3], [2, 3, 1],
                            #     [3, 1, 2], [3, 2, 1]]

