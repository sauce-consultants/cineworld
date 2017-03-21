defmodule Cineworld.Films do
  @moduledoc """
  Get Film details for a givne cinema
  """

  def get(cinema_id, edi) do
    %{films: films} = Cineworld.Client.request("films", %{cinema: cinema_id, edi: edi, full: "true"})
    films |> List.first
  end

  def list(cinema_id) do
    Cineworld.Client.request("films", %{cinema: cinema_id, full: "true"})
  end
  def list(cinema_id, date) do
    Cineworld.Client.request("films", %{cinema: cinema_id, date: date, full: "true"})
  end

end
