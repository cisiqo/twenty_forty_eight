defmodule TwentyFortyEightWeb.Game do
  @moduledoc """
  Game live view.
  """

  use TwentyFortyEightWeb, :live_view

  import TwentyFortyEightWeb.GameComponents

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "2048")}
  end
end
