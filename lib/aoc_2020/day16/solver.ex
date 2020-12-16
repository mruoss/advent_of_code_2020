defmodule AOC2020.Day16.Solver do
  alias AOC2020.Day16.Parser

  def solve(stream, :first) do
    stream
    |> Stream.map(&String.trim(&1, "\n"))
    |> Stream.concat([:end])
    |> Stream.transform({0, :rules, []}, &run(:first, &1, &2))
    |> Enum.at(0)
    |> elem(0)
  end

  def solve(stream, :second) do
  end

  defp first(:first, :end, acc), do: {[acc], nil}
  defp first(:first, "", acc), do: {[], acc}
  defp first(:first, "your ticket:", {0, _, rules}), do: {[], {0, :your_ticket, rules}}
  defp first(:first, "nearby tickets:", {0, _, rules}), do: {[], {0, :nearby_ticket, rules}}
  defp first(:first, rule, {error_rate, :rules, rules}), do: {[], {error_rate, :rules, [Parser.parse_rule(rule) | rules]}}
  defp first(:first, _, {0, :your_ticket, rules}), do: {[], {0, :your_ticket, rules}}
  defp first(:first, ticket, {error_rate, :nearby_ticket, rules}) do
    errors = ticket
    |> Parser.parse_ticket()
    |> Enum.reject(fn field_value ->
       Enum.any?(rules, fn {_field_name, rule} -> rule.(field_value) end)
    end)
    |> Enum.sum()

    {[], {error_rate + errors, :nearby_ticket, rules}}
  end
end
