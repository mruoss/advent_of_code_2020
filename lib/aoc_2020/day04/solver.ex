defmodule AOC2020.Day04.Solver do
  alias AOC2020.Day04.Parser

  @required_fields [:byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid]
  @optional_fields [:cid]

  def solve(lines, :first) do
    lines
    |> Parser.split_passports()
    |> Stream.map(&Parser.parse_passport/1)
    |> Stream.filter(fn passport ->
      Enum.all?(@required_fields, &has_entry?(passport, &1))
    end)
    |> Enum.count()
  end

  defp has_entry?(passport, field), do: Keyword.get(passport, field) != nil



end
