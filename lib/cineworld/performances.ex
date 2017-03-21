defmodule Cineworld.Performances do
  @moduledoc """
  Get Performance details
  """

  def list(cinema_id, edi, date) do
    Cineworld.Client.request("performances", %{cinema: cinema_id, film: edi, date: date})
  end

end
