defmodule Mix.Tasks.Day17 do
  alias AOC2020.Day17.Solver

  use Mix.Task
  @impl Mix.Task
  def run([subtask]) do
    "priv/input/day17.txt"
    |> File.read!()
    |> Solver.solve(String.to_existing_atom(subtask))
    |> IO.inspect()
  end
end
