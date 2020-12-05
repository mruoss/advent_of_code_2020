defmodule AOC2020.Day04.Parser do
  def split_passports(lines) do
    lines
    |> Stream.concat([:end])
    |> Stream.transform("", fn
        :end, acc -> {[String.trim(acc)], ""}
        "\n", acc -> {[String.trim(acc)], ""}
        line, acc -> {[], String.replace(line, "\n", " ") <> acc}
      end)
    |> Stream.reject(&Kernel.==(&1, :end))
  end

  def parse_passport(passport) do
    passport
    |> String.split(" ")
    |> Enum.map(&String.split(&1, ":"))
    |> Enum.map(fn [key, value] -> {String.to_atom(key), value} end)
  end
end
