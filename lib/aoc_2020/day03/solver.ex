defmodule AOC2020.Day03.Solver do
  alias AOC2020.Day03.Map

  def solve(lines, :first) do
    lines
    |> Stream.map(&String.trim/1)
    |> Stream.map(&Map.to_binary/1)
    |> Stream.with_index()
    |> Stream.map(fn {trees, row} ->
      length = Enum.count(trees)
      Enum.at(trees, rem(row * 3, length))
    end)
    |> Enum.sum()


  end

end
