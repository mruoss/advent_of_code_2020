defmodule AOC2020.Day08.Solver do

  def solve(input, :first) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " ", parts: 2, trim: true))
    |> Enum.map(fn [instr, val] -> {String.to_atom(instr), String.to_integer(val)} end)
    |> execute({0, 0}, %{})
  end

  def solve(stream, :second) do
  end

  defp execute(code, {ptr, acc}, history) do
    if Map.get(history, ptr, false) == true do
      {:loop, acc}
    else
      next_history = Map.put(history, ptr, true)
      next_state = instr(Enum.at(code, ptr), ptr, acc)
      execute(code, next_state, next_history)
    end
  end

  defp instr({:acc, val}, ptr, acc), do: {ptr + 1, acc + val}
  defp instr({:nop, _}, ptr, acc), do: {ptr + 1, acc}
  defp instr({:jmp, val}, ptr, acc), do: {ptr + val, acc}
end
