# Warmup

# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.

def range(min, max)
  return [] if max == min  # base case is array
  [min] + range(min + 1, max)
end

p range(1, 5) # [1, 2, 3, 4]

# https://www.reddit.com/r/ruby/comments/33zl52/need_help_with_using_recursion_for_factorials/ 
# thanks for the illumination, 0x0dea, wherever you are...

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

# Select without a passed-in function (note how the recursive nature of the function
# is made clear by the return value of the block in the case where the predicate is not met)

# [1,2,3,4,5].inject([]) {|memo, obj| obj > 3 ? memo << obj : memo }

p sum_array_recursive([4,3,2,7,9])

arr = [4,3,2,7,9]

p sum_array_iterative(arr)


# https://www.leighhalliday.com/recursion-in-ruby

# # Exponentiation

# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]


# # Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]


# # Fibonacci
# # Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

# # You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

# # Binary Search
# # Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

# # Make sure that these test cases are working:

# bsearch([1, 2, 3], 1) # => 0
# bsearch([2, 3, 4, 5], 3) # => 1
# bsearch([2, 4, 6, 8, 10], 6) # => 2
# bsearch([1, 3, 4, 5, 9], 5) # => 3
# bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# # Merge Sort
# # Implement a method merge_sort that sorts an Array:

# # The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# # You'll want to write a merge helper method to merge the sorted halves.
# # To get a visual idea of how merge sort works, watch this gif and check out this diagram.
# # Array Subsets
# # Write a method subsets that will return all subsets of an array.

# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# # You can implement this as an Array method if you prefer.

# # Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# # Those that do not contain 3 (all of these are subsets of [1, 2]).
# # For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.
# # Permutations
# # Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

# permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]
# # You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]

