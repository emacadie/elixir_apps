defmodule PluralsightTweetTest do
  use ExUnit.Case
  doctest PluralsightTweet

  test "greets the world" do
    IO.puts "This is the generated test"
    assert PluralsightTweet.hello() == :world
  end

  test "the truth" do
    IO.puts("doing 1 + 1 == 2")
    assert 1 + 1 == 2
  end

  @tag watching: true
  test "another test" do
    IO.puts "This test originally failed"
    # assert 2 + 2 == 5
    assert 2 + 2 == 4
  end

end
