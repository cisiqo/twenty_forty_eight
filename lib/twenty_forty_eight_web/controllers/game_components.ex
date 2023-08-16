defmodule TwentyFortyEightWeb.GameComponents do
  @moduledoc """
  Supporting components for game play.
  """
  use Phoenix.Component

  attr :value, :integer

  def tile(assigns) do
    ~H"""
    <div class="text-center p-4 text-3xl shadow-lg rounded-lg bg-purple-500 h-16 w-32">
      <%= @value %>
    </div>
    """
  end
end
