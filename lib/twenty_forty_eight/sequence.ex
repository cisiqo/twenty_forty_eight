defmodule TwentyFortyEight.Sequence do
  @moduledoc """
  Apply rules for the 2048 game to a single sequence.
  The sequence may represent a row or column in the real game.
  """

  @doc """
  Combined values to the left. Resulting sequence will be of the same length 
  as the input sequence but padded with nil values.

  If you need to combined in a different direction, you should prepare the sequence
  by using Enum.reverse().
  """
  def combined(sequence) do
    sequence_len = length(sequence)

    sequence
    |> Enum.reject(fn v -> v == nil end)
    |> combined([])
    |> pad_list(sequence_len)
  end

  defp combined([], acc), do: acc |> Enum.reverse() |> List.flatten()
  defp combined([h | t], []), do: combined(t, [h])
  defp combined([h | t], [ah | at]) when h == ah, do: combined(t, [[h * 2] | at])
  defp combined([h | t], a), do: combined(t, [h | a])

  @doc """
  Pad a `list` to a the length of `count` with `value` as the padding character.
  """
  def pad_list(list, count, value \\ nil) do
    add_count = count - length(list)
    [list | Enum.map(1..add_count//1, fn _ -> value end)] |> List.flatten()
  end
end
