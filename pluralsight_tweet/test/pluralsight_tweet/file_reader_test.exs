defmodule FileReaderTest do
  use ExUnit.Case

  test "Passing a file should return a string" do
    IO.puts "Running Passing a file should return a string"
    str = PluralsightTweet.FileReader.get_strings_to_tweet(
      Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "sample.txt")
    )

    assert str != nil
  end

  test "Will not return a line longer than 140 char" do
    IO.puts("Running Will not return a line longer than 140 char")
    str = PluralsightTweet.FileReader.get_strings_to_tweet(
      Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "test/too_long.txt")
    )

    assert str == "short line"
  end


  test "An empty string should return an empty string" do
    IO.puts("Running An empty string should return an empty string")
    str = PluralsightTweet.FileReader.pick_string("")
    assert str == ""
  end

end

