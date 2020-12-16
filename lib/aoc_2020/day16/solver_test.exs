defmodule AOC2020.Day16.SolverTest do
  use ExUnit.Case

  alias AOC2020.Day16.Solver, as: MUT

  describe "solve/2" do
    test "should solve first task with first test input from website correctly" do
      input = """
              class: 1-3 or 5-7
              row: 6-11 or 33-44
              seat: 13-40 or 45-50

              your ticket:
              7,1,14

              nearby tickets:
              7,3,47
              40,4,50
              55,2,20
              38,6,12
              """
              |> String.split("\n", trim: true)
              |> Enum.map(fn s -> s <> "\n" end)

      assert 71 == MUT.solve(input, :first)
    end

    test "should solve second task with first test input from website correctly" do
    end
  end
end
