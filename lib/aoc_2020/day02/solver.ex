defmodule AOC2020.Day02.Solver do
  alias AOC2020.Day02.Parser

  def solve(lines, :first) do
    lines
    |> Stream.map(&Parser.parse/1)
    |> Stream.filter(&password_is_valid/1)
    |> Enum.count()
  end

  defp password_is_valid({lower, upper, char, string}) do
    parts = (String.split(string, char) |> Enum.count()) - 1

    parts >= lower && parts <= upper
  end

end
