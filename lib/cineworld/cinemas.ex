defmodule Cineworld.Cinemas do
  @moduledoc """
  Get Cinema details
  """

  def get(cinema_id) do
    %{cinemas: cinemas} = Cineworld.Client.request("cinemas", %{cinema: cinema_id})
    cinemas |> List.first
  end

  def list do
    Cineworld.Client.request("cinemas")
  end

end
