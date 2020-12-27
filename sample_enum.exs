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


end
