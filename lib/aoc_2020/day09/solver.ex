defmodule AOC2020.Day09.Solver do

  def solve(stream, preamble_length, subtask) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
    |> Stream.with_index()
    |> Stream.transform([], fn
      ({next, idx}, acc) when idx < preamble_length -> {[], acc ++ [next]}
      ({next, _idx}, [_hd | tail] = acc) ->
        if Enum.any?(acc, fn elem -> Enum.member?(acc, next - elem) end) do
          {[], tail ++ [next]}
        else
          {[next], nil}
        end
    end)
    |> Enum.at(0)
  end
end
