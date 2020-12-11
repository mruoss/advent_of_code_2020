defmodule AOC2020.Day10.Solver do
  require Integer

  def solve(input, :first) do
    diffs = input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.sort()
    |> Enum.reduce({0, {0, 0, 1}}, fn (current, {prev, diffs}) ->
      diff = (current - prev - 1)
      new_diffs = put_elem(diffs, diff, (elem(diffs, diff) + 1))
      {current, new_diffs}
    end)
    |> elem(1)

    elem(diffs, 0) * elem(diffs, 2)
  end
end
