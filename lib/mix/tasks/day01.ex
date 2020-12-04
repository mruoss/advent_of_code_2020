defmodule Mix.Tasks.Day01 do
  alias AOC2020.Day01

  use Mix.Task
  @impl Mix.Task
  def run(_) do
    "priv/input/day01.txt"
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Day01.run(2020)
    |> IO.puts()
  end
end
