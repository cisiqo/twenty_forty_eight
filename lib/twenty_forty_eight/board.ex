defmodule TwentyFortyEight.Board do
  @moduledoc """
  Represent a board for the 2048 game.
  """
  alias TwentyFortyEight.Sequence

  @width 4
  @height 4

  defstruct [:width, :height, :data]

  @spec new(integer(), integer()) :: %__MODULE__{}
  def new(width, height),
    do:
      %__MODULE__{width: width, height: height, data: Sequence.pad([], width * height)}
      |> add_random_number()
      |> add_random_number()

  def shift(board = %__MODULE__{}, :up) do
    new_data =
      board.data
      |> to_rows()
      |> Enum.map(&Sequence.combined/1)
      |> rows_to_board()

    %__MODULE__{board | data: new_data}
  end

  def shift(board = %__MODULE__{}, :left) do
    new_data =
      board.data
      |> to_cols()
      |> Enum.map(&Sequence.combined/1)
      |> cols_to_board()

    %__MODULE__{board | data: new_data}
  end

  def shift(board = %__MODULE__{}, :right) do
    new_data =
      board.data
      |> to_cols()
      |> Enum.map(&Enum.reverse/1)
      |> Enum.map(&Sequence.combined/1)
      |> Enum.map(&Enum.reverse/1)
      |> cols_to_board()

    %__MODULE__{board | data: new_data}
  end

  def shift(board = %__MODULE__{}, :down) do
    new_data =
      board.data
      |> to_rows()
      |> Enum.map(&Enum.reverse/1)
      |> Enum.map(&Sequence.combined/1)
      |> Enum.map(&Enum.reverse/1)
      |> rows_to_board()

    %__MODULE__{board | data: new_data}
  end

  @doc """
  Add a random 2 or 4 to an empty location in the board.
  """
  def add_random_number(board = %__MODULE__{}) do
    add_at_index =
      Enum.with_index(board.data)
      |> Enum.map(fn {x, i} -> if x == nil, do: i end)
      |> Enum.reject(&(&1 == nil))
      |> Enum.random()

    new_data =
      Enum.with_index(board.data)
      |> Enum.map(fn {x, i} -> if i == add_at_index, do: Enum.random([2, 4]), else: x end)

    %__MODULE__{board | data: new_data}
  end

  # Convert a flat list to a list of lists containing row values.
  defp to_rows(board) do
    Enum.map(0..(@width - 1), fn x -> Enum.slice(board, x..(@width * @height)//@width) end)
  end

  # Convert a flat list to a list of lists containing column values.
  defp to_cols(board) do
    Enum.chunk_every(board, @width)
  end

  defp cols_to_board(cols) do
    cols
    |> List.flatten()
  end

  defp rows_to_board(rows) do
    rows
    |> List.flatten()
    |> to_rows()
    |> List.flatten()
  end
end
