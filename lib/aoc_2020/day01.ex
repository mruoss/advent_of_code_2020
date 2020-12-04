defmodule AOC2020.Day01 do
  def run(input, target) do
    input
    |> Enum.sort()
    |> calculate(0, -1, target)
  end

  defp calculate(list, lower_ptr, upper_ptr, target) do
    lower_val = Enum.at(list, lower_ptr)
    upper_val = Enum.at(list, upper_ptr)
    sum = lower_val + upper_val

    cond do
      sum < target -> calculate(list, lower_ptr + 1, upper_ptr, target)
      sum > target -> calculate(list, lower_ptr, upper_ptr - 1, target)
      true -> lower_val * upper_val
    end
  end
end
