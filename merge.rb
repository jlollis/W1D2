def merge(a, b)
  index_a = 0
  index_b = 0
  c = []
  while index_a < a.length and index_b < b.length do
    if a[index_a] <= b[index_b] then
      c << a[index_a]
      index_a = index_a + 1
    else
      c << b[index_b]
      index_b = index_b + 1
    end
  end
  if (index_a < a.length) then
    for i in (index_a..a.length-1) do
      c << a[i]
    end
  else
    for i in (index_b..b.length-1) do
      c << b[i]
    end
  end
  return c
end

p merge([1, 2, 3, 4, 5, 7], [3, 5, 6, 9, 11, 15, 18])