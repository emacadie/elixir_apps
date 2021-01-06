defmodule PluralsightTweet.FileReader do

  @doc """
  This function takes a path to a file, reads the file, and 
  calls pick_string.
  
  iex> PluralsightTweet.FileReader.get_strings_to_tweet("priv/test/too_long.txt")
  "short line"
  """
  def get_strings_to_tweet(path) do
    File.read!(path)
    |> pick_string
  end

  def pick_string(str) do
    str
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&String.length(&1) <= 140)
    |> Enum.random()
  end

end



