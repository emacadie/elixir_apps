defmodule Sample.Utils do
  def square(a), do: a * a
    
  def sum(a,b), do: a + b

  def custom_func(a, f) do
    IO.puts("Calling func f with param: #{a}" )
    f.(a)
  end


end

