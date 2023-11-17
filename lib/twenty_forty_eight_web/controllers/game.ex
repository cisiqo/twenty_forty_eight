defmodule TwentyFortyEightWeb.Game do
  @moduledoc """
  Game live view.
  """

  alias TwentyFortyEight.Board

  use TwentyFortyEightWeb, :live_view

  import TwentyFortyEightWeb.GameComponents

  def mount(_params, _session, socket) do
    board = TwentyFortyEight.Board.new(4, 4)

    {:ok, assign(socket, page_title: "2048", board: board)}
  end

  def handle_event("move", %{"value" => dir}, socket) do
    shift_dir =
      case dir do
        "left" -> :left
        "right" -> :right
        "up" -> :up
        "down" -> :down
      end

    board = Board.shift(socket.assigns.board, shift_dir) |> Board.add_random_number()

    {:noreply, assign(socket, board: board)}
  end

  def handle_event("move", %{"key" => dir}, socket) do
    shift_dir =
      case dir do
        "ArrowUp" -> :up
        "w" -> :up
        "ArrowDown" -> :down
        "s" -> :down
        "ArrowLeft" -> :left
        "a" -> :left
        "ArrowRight" -> :right
        "d" -> :right
        _ -> :ok
      end

    if shift_dir != :ok do
      board = Board.shift(socket.assigns.board, shift_dir) |> Board.add_random_number()
      {:noreply, assign(socket, board: board)}
    else
      {:noreply, assign(socket, board: socket.assigns.board)}
    end
  end
end
