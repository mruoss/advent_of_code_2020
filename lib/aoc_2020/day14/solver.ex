defmodule AOC2020.Day14.Solver do
  alias AOC2020.Day14.Parser

  def solve(stream, :first) do
    stream
    |> Stream.map(&String.trim/1)
    |> Stream.map(&Parser.parse_line/1)
    |> Stream.concat([:end])
    |> Stream.transform({%{}, nil}, fn
      :end, {mem, _} -> {[mem], nil}
      {:mask, mask}, {mem, _} -> {[], {mem, mask}}
      {:mem, addr, val}, {mem, mask} ->
        [addend, subtrahend] = create_bitmasks(mask)
        {[], {Map.put(mem, addr, val |> Bitwise.bor(addend) |> Bitwise.band(subtrahend)), mask}}
    end)
    |> Enum.at(0)
    |> Enum.map(&elem(&1, 1))
    |> Enum.sum()
  end

  def solve(input, :second) do
  end

  defp create_bitmasks(mask) do
    Enum.reduce(mask, ['',''], fn
      ?X, [addend, subtrahend] -> [[?0 | addend], [?1 | subtrahend]]
      ?0, [addend, subtrahend] -> [[?0 | addend], [?0 | subtrahend]]
      ?1, [addend, subtrahend] -> [[?1 | addend], [?1 | subtrahend]]
    end)
    |> Enum.map(fn modifier -> modifier |> Enum.reverse() |> to_string() |> String.to_integer(2) end)
  end
end
