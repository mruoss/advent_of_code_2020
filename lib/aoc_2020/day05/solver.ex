defmodule AOC2020.Day05.Solver do
  alias AOC2020.Day05.Seat
  alias AOC2020.Day05.Parser

  def solve(input, :first) do
    input
    |> Parser.parse()
    |> Enum.max(&Seat.gt/2)
    |> Seat.to_integer()
  end
end
