defmodule Sample.Enum do
  # this has to be before the one that takes a list as an arg
  def first( [] ) do
    nil
  end

  def first( list ) do
    hd( list )
  end

  # we had [head | tail] and we did not use "tail"
  # so we got a warning
  def first_with_matching( [head | _] ) do
    head
  end

  def first_again(list) when length(list) == 0, do: nil

  def first_again([head | _ ]), do: head

  # if "0" is default value for val
  def add(list, val \\ 0 ) do
    trace(val)
    [val | list]
  end

  defp trace(string) do
    IO.puts( "The value passed in was #{string}")
    IO.puts "Without parens: The value passed in was #{string}"
  end

  def first_with_if(list) do
    if (length(list) == 0) do
      nil
    else
      hd(list)
    end
  end

  def first_with_unless(list) do
    unless length( list ) == 0 do
      hd( list )
    end
  end

  def map([], _), do: []

  def map([hd|tl], f) do
    IO.puts "Calling map with head #{hd} and tail #{tl}"
    [f.(hd) | map(tl, f)]
  end

  # not tail-recursive, since "+" is last operation
  def list_length([]), do: 0
  def list_length([_|tail]) do
    1 + list_length(tail)
  end

  def other_length([_|tail]),
    do: other_length(tail, 1)
  def other_length([], len),
    do: len
  def other_length([_|tail], len),
    do: other_length(tail, len + 1)

  # it is hard to do some tail recursive stuff without reversing
  def reverse(l),
    do: reverse(l, [])
  def reverse([], reversed),
    do: reversed
  def reverse([head|tail], reversed),
    do: reverse(tail, [head|reversed])

  def other_map([head|tail], f),
    do: other_map(tail, f, [f.(head)])
  def other_map([], _, result),
    do: reverse(result)
  def other_map([head|tail], f, result),
    do: other_map(tail, f, [f.(head)|result])

end

