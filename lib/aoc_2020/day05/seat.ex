defmodule AOC2020.Day05.Seat do
  def cmp(?B, ?F), do: :greater
  def cmp(?F, ?B), do: :lower
  def cmp(?R, ?L), do: :greater
  def cmp(?L, ?R), do: :lower
  def cmp(_, _), do: :equal

  def gt(seat1, seat2) do
    0..9
    |> Enum.reduce_while(nil, fn idx, _ ->
      case cmp(Enum.at(seat1, idx), Enum.at(seat2, idx)) do
        :greater -> {:halt, true}
        :lower -> {:halt, false}
        :equal -> {:cont, false}
      end
    end)
  end

  def to_integer(seat) do
    seat
    |> Enum.reverse()
    |> Enum.reduce({0, 1}, fn char, {sum, factor} ->
      {sum + to_integer_c(char, factor), 2 * factor}
    end)
    |> elem(0)
  end

  defp to_integer_c(?B, factor), do: factor
  defp to_integer_c(?R, factor), do: factor
  defp to_integer_c(_, _), do: 0
end
