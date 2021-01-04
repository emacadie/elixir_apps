defmodule PluralsightTweet.FileReader do
  def get_strings_to_tweet(path) do
    File.read!(path)
    |> String.split("\n")
    |> Enum.map(&String.trim/1)
    |> Enum.filter(&String.length(&1) <= 140)
    |> Enum.random()
    # you could do this:
    # |> Enum.filter(fn str -> String.length(str) <= 140 end)
  end
end

