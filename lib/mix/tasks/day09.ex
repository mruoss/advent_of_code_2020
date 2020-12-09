defmodule Mix.Tasks.Day09 do
  alias AOC2020.Day09.Solver

  use Mix.Task
  @impl Mix.Task
  def run([subtask]) do
    "priv/input/day09.txt"
    |> File.stream!()
    |> Solver.solve(25, String.to_existing_atom(subtask))
    |> IO.inspect()
  end
end
