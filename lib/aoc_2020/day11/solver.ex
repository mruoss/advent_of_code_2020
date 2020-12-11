defmodule AOC2020.Day11.Solver do
  require Integer

  def solve(input, :first) do
    floorplan = input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse/1)

    rows = floorplan |> Enum.count()
    cols = floorplan |> Enum.at(0) |> Enum.count()

    reduce(floorplan, true, rows, cols)
  end

  def solve(input, :second) do
  end

  defp reduce(situation, false, _, _) do
    situation
    |> Enum.map(fn row ->
      row
      |> Enum.reject(&Kernel.==(&1, nil))
      |> Enum.sum()
    end)
    |> Enum.sum()
  end

  defp reduce(situation, true, rows, cols) do
    {new_situation, changed} = Enum.map_reduce(0..rows-1, false, fn (row, row_changed) ->
      {row, col_changed} = Enum.map_reduce(0..cols-1, row_changed, fn (col, col_changed) ->
        sum = Enum.reduce((row - 1)..(row + 1), 0, fn inner_row, row_acc ->
          Enum.reduce((col - 1)..(col + 1), row_acc, fn
            ^col, col_acc when row == inner_row -> col_acc
            inner_col, col_acc -> col_acc + lookup(situation, inner_row, inner_col)
            end)
        end)


        {occupied, changed} = iterate(Matrix.elem(situation, row, col, 0), sum)
        {occupied, col_changed || changed}
      end)
      {row, row_changed || col_changed}
    end)

    reduce(new_situation, changed, rows, cols)
  end

  defp lookup(_, row, _) when row < 0, do: 0
  defp lookup(_, _, col) when col < 0, do: 0
  defp lookup(situation, row, col), do: Matrix.elem(situation, row, col, 0) || 0

  defp iterate(0, 0), do: {1, true}
  defp iterate(1, sum) when sum >= 4, do: {0, true}
  defp iterate(occupied, _), do: {occupied, false}

  defp parse(line) do
    line
    |> to_charlist()
    |> Enum.map(fn
      ?. -> nil
      ?L -> 0
    end)
  end
end
