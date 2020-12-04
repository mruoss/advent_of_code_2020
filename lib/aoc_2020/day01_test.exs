defmodule AOC2020.Day01Test do
  use ExUnit.Case

  alias AOC2020.Day01, as: MUT

  test "should solve test from website correctls" do
    input = [1721, 979, 366, 299, 675, 1456]
    assert 514_579 == MUT.run(input, 2020)
  end
end
