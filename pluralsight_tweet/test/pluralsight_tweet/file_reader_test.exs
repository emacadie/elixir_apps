defmodule FileReaderTest do
  use ExUnit.Case
  import PluralsightTweet.FileReader
  import Mock

  doctest PluralsightTweet.FileReader
  test "Passing a file should return a string" do
    IO.puts "Running Passing a file should return a string"
    str = get_strings_to_tweet(
      Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "sample.txt")
    )

    assert str != nil
  end

  test "Will not return a line longer than 140 char" do
    IO.puts("Running Will not return a line longer than 140 char")
    str = get_strings_to_tweet(
      Path.join("#{:code.priv_dir(:pluralsight_tweet)}", "test/too_long.txt")
    )

    assert str == "short line"
  end

  test "An empty string should return an empty string" do
    IO.puts("Running An empty string should return an empty string")
    str = pick_string("")
    assert str == ""
  end

  test "An empty string should return an empty string with mock" do
    IO.puts("Running An empty string should return an empty string with mock")
    with_mock File, [read!: fn(_) -> "" end] do
      str = pick_string("")
      assert str == ""
    end
    
  end

  test "the string should be trimmed" do
    IO.puts("running the string should be trimmed")
    with_mock File, [read!: fn(_) -> " ABC " end] do
      str = get_strings_to_tweet("no_such_file.txt")
      assert str == "ABC"
    end
  end

end

