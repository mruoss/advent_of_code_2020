defmodule AOC2020.Day17.Grid do

  def next_state(grid, cube, upper) do
    state = get_state(grid, cube, upper)
    satellites = get_satellites(grid, cube, upper)
    cond do
       state == 0 and satellites == 3 -> 1
       state == 1 and satellites >= 2 and satellites <= 3 -> 1
       true -> 0
    end
  end

  def get_satellites(map, {x, y, z}, upper) do
    Enum.reduce((x-1..x+1), 0, fn cx, accx ->
      Enum.reduce((y-1..y+1), accx, fn cy, accy ->
        Enum.reduce((z-1..z+1), accy, fn
          cz, accz when cx == x and cy == y and cz == z -> accz
          cz, accz -> accz + get_state(map, {cx, cy, cz}, upper)
        end)
      end)
    end)
  end

  def get_state(grid, {x, y, z}, {ux ,uy, uz})
      when x >= 0 and x <= ux and y >= 0 and y <= uy and z >= 0 and z <= uz,
      do: grid |> Enum.at(x, []) |> Enum.at(y, []) |> Enum.at(z, 0)
  def get_state(_, _, _), do: 0

  def sum(grid) do
    Enum.reduce(grid, 0, fn cx, sumx ->
      Enum.reduce(cx, sumx, fn cy, sumy ->
        sumy + Enum.sum(cy)
      end)
    end)
  end
end
