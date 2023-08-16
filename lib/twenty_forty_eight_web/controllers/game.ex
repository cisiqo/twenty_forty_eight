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
end
