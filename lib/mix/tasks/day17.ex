defmodule Mix.Tasks.Day17 do
  alias AOC2020.Day17.Solver

  use Mix.Task
  @impl Mix.Task
  def run(["first"]) do
    "priv/input/day17.txt"
    |> File.read!()
    |> Solver.solve(:first)
    |> IO.inspect()
  end 
end
