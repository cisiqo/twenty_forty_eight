defmodule TwentyFortyEightWeb.GameComponents do
  use Phoenix.Component

  attr :value, :integer

  def tile(assigns) do
    ~H"""
    <div class="text-center p-4 text-3xl shadow-lg rounded-lg bg-purple-500"><%= @value %></div>
    """
  end
end
