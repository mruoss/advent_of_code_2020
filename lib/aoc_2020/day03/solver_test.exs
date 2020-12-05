defmodule AOC2020.Day03.SolverTest do
  use ExUnit.Case

  alias AOC2020.Day03.Solver, as: MUT

  describe "solve/2" do
    test "should solve first task with test input from website correctly" do
      input = """
      ..##.......
      #...#...#..
      .#....#..#.
      ..#.#...#.#
      .#...##..#.
      ..#.##.....
      .#.#.#....#
      .#........#
      #.##...#...
      #...##....#
      .#..#...#.#
      """
      |> String.split("\n", trim: true)
      |> Enum.map(fn s -> s <> "\n" end)

      assert 7 == MUT.solve(input, :first)
    end

    test "should solve second task with test input from website correctly" do
    end
  end
end
