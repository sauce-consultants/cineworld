defmodule CineworldClientTest do
  use ExUnit.Case

  test "request to a valid endpoint returns a valid response" do
    %{cinemas: cinemas} = Cineworld.Client.request("cinemas")
    assert cinemas |> Enum.count > 0
  end

  test "request to an invalid endpoint returns a valid response" do
    %{error: error} = Cineworld.Client.request("cinemas_test")
    assert error == "Not Found"
  end
end
