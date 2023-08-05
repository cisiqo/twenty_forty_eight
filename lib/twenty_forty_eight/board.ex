defmodule TwentyFortyEight.Board do
  @moduledoc """
  Represent a board for the 2048 game.
  """
  alias TwentyFortyEight.Sequence
  @width 4
  @height 4

  defstruct [:width, :height, :data]

  def new(width, height, data), do: %__MODULE__{width: width, height: height, data: data}

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

  # Convert a flat list to a list of lists containing row values.
  def to_rows(board) do
    Enum.map(0..(@width - 1), fn x -> Enum.slice(board, x..(@width * @height)//@width) end)
  end

  # Convert a flat list to a list of lists containing column values.
  def to_cols(board) do
    Enum.chunk_every(board, @width)
  end

  def cols_to_board(cols) do
    cols
    |> List.flatten()
  end

  def rows_to_board(rows) do
    rows
    |> List.flatten()
    |> to_rows()
    |> List.flatten()
  end
end
