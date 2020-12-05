defmodule Mix.Tasks.Day03 do
  alias AOC2020.Day03.Solver

  use Mix.Task
  @impl Mix.Task
  def run([subtask]) do
    "priv/input/day03.txt"
    |> File.stream!()
    |> Solver.solve(String.to_existing_atom(subtask))
    |> IO.puts()
  end
end
