defmodule TwentyFortyEight.Sequence do
  def combined(sequence) do
    sequence_len = length(sequence)

    sequence
    |> Enum.reject(fn v -> v == nil end)
    |> combined([])
    |> pad_list(sequence_len)
  end

  def combined([], acc), do: acc |> Enum.reverse() |> List.flatten()
  def combined([h | t], []), do: combined(t, [h])
  def combined([h | t], [ah | at]) when h == ah, do: combined(t, [[h * 2] | at])
  def combined([h | t], a), do: combined(t, [h | a])

  def pad_list(list, count, value \\ nil) do
    add_count = count - length(list)
    [list | Enum.map(1..add_count//1, fn _ -> value end)] |> List.flatten()
  end
end
