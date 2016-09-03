defmodule MyList do
  def all?([], _func), do: true
  def all?([ head | tail ], func), do: func.(head) and all?(tail, func)

  def each([], _func), do: []
  def each([ head | tail ], func), do: [ func.(head) | each(tail, func) ]

  def filter([], _func), do: []
  def filter([ head | tail ], func) do
    if func.(head) do
      [ head | filter(tail, func) ]
    else
      filter(tail, func)
    end
  end

  def split(list, num) do
    _split([], list, num)
  end
  defp _split(list, src, 0), do: { list, src }
  defp _split(list, [ head | tail ], num) do
    _split(list ++ [head], tail, num - 1)
  end

  def take(_list, 0), do: []
  def take([ head | tail ], num) do
    [head] ++ take(tail, num - 1)
  end

  def flatten([]), do: []
  def flatten([ head | tail ]) do
    flatten(head) ++ flatten(tail)
  end
  def flatten(head), do: [head]
end

list = [1,2,3]
MyList.all?(list, &(&1 < 4)) # => true

list = [1,2,3,4,5]
MyList.all?(list, &(&1 < 4)) # => false

MyList.each(list, &(&1 * 2)) # => [2, 4, 6, 8, 10]

require Integer
MyList.filter(list, &Integer.is_even/1) # => [2, 4]

Enum.split(list, 3)   # => {[1, 2, 3], [4, 5]}
MyList.split(list, 3) # => {[1, 2, 3], [4, 5]}

Enum.split(list, 5)    # => {[1, 2, 3, 4, 5], []}
MyList.split(list, 5)  # => {[1, 2, 3, 4, 5], []}

Enum.take(list, 3)    # => [1, 2, 3]
MyList.take(list, 3)  # => [1, 2, 3]

list = [ 1, [ 2, 3, [4] ], 5, [[[6]]]]
List.flatten(list)   # => [1, 2, 3, 4, 5, 6]
MyList.flatten(list) # => [1, 2, 3, 4, 5, 6]
